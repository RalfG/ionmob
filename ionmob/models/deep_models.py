import numpy as np
import tensorflow as tf


class ProjectToInitialCCS(tf.keras.layers.Layer):
    """
    Simple linear regression model, calculates ccs value as linear mapping from mz, charge -> ccs
    """

    def __init__(self, slopes, intercepts):
        super(ProjectToInitialCCS, self).__init__()
        self.slopes = tf.constant([slopes])
        self.intercepts = tf.constant([intercepts])

    def call(self, inputs):
        mz, charge = inputs[0], inputs[1]
        # since charge is one-hot encoded, can use it to gate linear prediction by charge state
        return tf.expand_dims(tf.reduce_sum((self.slopes * mz + self.intercepts) * tf.squeeze(charge), axis=1), 1)


class DeepRecurrentModel(tf.keras.models.Model):
    """
    Deep Learning model combining initial linear fit with sequence based features, both scalar and complex
    Model architecture is inspired by Meier et al.: https://doi.org/10.1038/s41467-021-21352-8
    """

    def __init__(self, slopes, intercepts, num_tokens, seq_len=50, emb_dim=128, gru_1=64, gru_2=128, rdo=0.0):

        super(DeepRecurrentModel, self).__init__()
        self.__seq_len = seq_len

        self.linear = ProjectToInitialCCS(slopes, intercepts)

        self.emb = tf.keras.layers.Embedding(input_dim=num_tokens + 1, output_dim=emb_dim, input_length=seq_len)

        self.gru1 = tf.keras.layers.Bidirectional(tf.keras.layers.GRU(gru_1, return_sequences=True))
        self.gru2 = tf.keras.layers.Bidirectional(tf.keras.layers.GRU(gru_2, return_sequences=False,
                                                                      recurrent_dropout=rdo))
        self.emb = tf.keras.layers.Embedding(number_tokens + 1, 128)
        self.gru1 = tf.keras.layers.Bidirectional(
            tf.keras.layers.GRU(64, return_sequences=True))
        self.gru2 = tf.keras.layers.Bidirectional(tf.keras.layers.GRU(64, return_sequences=False,
                                                                      recurrent_dropout=0.2))

        self.dense1 = tf.keras.layers.Dense(128, activation='relu',
                                            kernel_regularizer=tf.keras.regularizers.l1_l2(1e-3, 1e-3))
        self.dense2 = tf.keras.layers.Dense(64, activation='relu')

        self.dropout = tf.keras.layers.Dropout(0.3)

        self.out = tf.keras.layers.Dense(1, activation=None)

    def call(self, inputs):
        """
        :param inputs: should contain: (mz, charge_one_hot, seq_as_token_indices, helix_score, gravy_score)
        """
        # get inputs
        mz, charge, seq, helix, gravy = inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]
        # sequence learning
        x_recurrent = self.gru2(self.gru1(self.emb(seq)))
        # concat to feed to dense layers
        concat = tf.keras.layers.Concatenate()(
            [charge, x_recurrent, helix, gravy])
        # regularize
        d1 = self.dropout(self.dense1(concat))
        d2 = self.dense2(d1)
        # combine simple linear hypotheses with deep part
        return self.linear([mz, charge]) + self.out(d2), self.out(d2)


class DeepAttentionModel(tf.keras.models.Model):
    """
    Deep Learning model combining initial linear fit with sequence based features, both scalar and complex
    Model architecture is inspired by Meier et al.: https://doi.org/10.1038/s41467-021-21352-8
    """
    def __init__(self, slopes, intercepts, num_tokens, seq_len=50, emb_dim=128, gru_enc_dec_dim=64, r_dim=128):
        super(DeepAttentionModel, self).__init__()
        self.__seq_len = seq_len

        self.linear = ProjectToInitialCCS(slopes, intercepts)
        self.emb = tf.keras.layers.Embedding(input_dim=num_tokens + 1, output_dim=128, input_length=seq_len)

        self.attention = tf.keras.layers.Attention()

        self.gru_enc = tf.keras.layers.GRU(gru_enc_dec_dim, return_state=True, return_sequences=True)
        self.gru_dec = tf.keras.layers.GRU(gru_enc_dec_dim, return_sequences=True)

        self.gru_pred = tf.keras.layers.Bidirectional(tf.keras.layers.GRU(r_dim, return_sequences=False))

        self.dense1 = tf.keras.layers.Dense(128, activation='relu',
                                            kernel_regularizer=tf.keras.regularizers.l1_l2(1e-3, 1e-3))

        self.dense2 = tf.keras.layers.Dense(64, activation='relu')

        self.dropout = tf.keras.layers.Dropout(0.3, name='Dropout')

        self.out = tf.keras.layers.Dense(1, activation=None)

    def call(self, inputs):
        """
        :param inputs: should contain: (mz, charge_one_hot, seq_as_token_indices, helix_score, gravy_score)
        """
        # get inputs
        mz, charge, seq, helix, gravy = inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]
        # sequence learning

        embedding = self.emb(seq)
        encoder_out, encoder_state = self.gru_enc(embedding)
        decoder_out = self.gru_dec(embedding, initial_state=encoder_state)

        attn_out = self.attention([encoder_out, decoder_out])

        seq_concat_attn = tf.keras.layers.Concatenate()([decoder_out, attn_out])

        x_recurrent = self.gru_pred(seq_concat_attn)

        # concat to feed to dense layers
        concat = tf.keras.layers.Concatenate()([charge, x_recurrent, helix, gravy])
        # regularize
        d1 = self.dropout(self.dense1(concat))
        d2 = self.dense2(d1)
        # combine simple linear hypotheses with deep part
        return self.linear([mz, charge]) + self.out(d2), self.out(d2)


class ConvEncoder(tf.keras.layers.Layer):
    def __init__(self, num_tokens=83, seq_len=50, emb_dim=32):
        super(ConvEncoder, self).__init__()

        self.emb = tf.keras.layers.Embedding(input_dim=num_tokens + 1, output_dim=emb_dim, input_length=seq_len)
        self.conv1 = tf.keras.layers.Conv2D(16, (5, 5), dilation_rate=1, activation="relu")
        self.conv2 = tf.keras.layers.Conv2D(32, (5, 5), dilation_rate=2, activation="relu")
        self.mp = tf.keras.layers.GlobalMaxPool2D()
        self.out = tf.keras.layers.Dense(128, activation='relu')

    def call(self, inputs):
        embedded = tf.expand_dims(self.emb(inputs), axis=3)
        x_convolved = self.conv2(self.conv1(embedded))
        return self.out(tf.keras.layers.Flatten()(x_convolved))


class SeqConvNet(tf.keras.models.Model):
    def __init__(self, slopes, intercepts, num_tokens=83, seq_len=50, emb_dim=16):
        super(SeqConvNet, self).__init__()

        self.linear = ProjectToInitialCCS(slopes, intercepts)

        self.convencoder = ConvEncoder(num_tokens, seq_len, emb_dim)

        self.d1 = tf.keras.layers.Dense(128, activation='relu')
        self.d2 = tf.keras.layers.Dense(32, activation='relu')
        self.dropout = tf.keras.layers.Dropout(0.3)
        self.out = tf.keras.layers.Dense(1, activation=None)

    def call(self, inputs):
        mz, charge, sequence = inputs[0], inputs[1], inputs[2]

        seq_convolved = self.convencoder(sequence)
        concat = tf.keras.layers.Concatenate()([charge, seq_convolved])
        seq_deep = self.d2(self.dropout(self.d1(concat)))

        return self.linear([mz, charge]) + self.out(seq_deep)


class KmerNet(tf.keras.models.Model):
    def __init__(self, slopes, intercepts, activation=None, dropout=0.3, l_1_reg=1e-2, l_2_reg=1e-3):
        super(KmerNet, self).__init__()
        self.linear = ProjectToInitialCCS(slopes, intercepts)

        self.d1 = tf.keras.layers.Dense(128, activation=activation,
                                        kernel_regularizer=tf.keras.regularizers.l1_l2(l_1_reg, l_2_reg))
        self.d2 = tf.keras.layers.Dense(64, activation=activation,
                                        kernel_regularizer=tf.keras.regularizers.l1_l2(l_1_reg, l_2_reg))
        self.d3 = tf.keras.layers.Dense(32, activation=activation,
                                        kernel_regularizer=tf.keras.regularizers.l1_l2(l_1_reg, l_2_reg))
        self.dropout = tf.keras.layers.Dropout(dropout)
        self.out = tf.keras.layers.Dense(1, activation=None)

    def call(self, inputs):
        mz, charge, k_mers = inputs[0], inputs[1], inputs[2]
        concat = tf.keras.layers.Concatenate()([charge, k_mers])
        kmer_deep = self.d3(self.d2(self.dropout(self.d1(concat))))

        return self.linear([mz, charge]) + self.out(kmer_deep)


if __name__ == '__main__':

    early_stopper = tf.keras.callbacks.EarlyStopping(
        monitor='val_output_1_loss',
        patience=10
    )

    checkpoint = tf.keras.callbacks.ModelCheckpoint(
        filepath='training/rnn/checkpoint',
        monitor='val_output_1_loss',
        save_best_only=True,
        mode='min'
    )

    csv_logger = tf.keras.callbacks.CSVLogger(
        filename='training/rnn/training.csv',
        separator=',',
        append=True
    )

    reduce_lr = tf.keras.callbacks.ReduceLROnPlateau(
        monitor='val_output_1_loss',
        factor=1e-1,
        patience=5,
        monde='auto',
        min_delta=1e-5,
        cooldown=0,
        min_lr=1e-7
    )

    cbs = [early_stopper, checkpoint, csv_logger, reduce_lr]

    model = DeepAttentionModel(np.array([[0.0, 0.0, 0.0, 0.0]], dtype=np.float32),
                               np.array([[0.0, 0.0, 0.0, 0.0]], dtype=np.float32), 83)

    model.build([(None, 1), (None, 4), (None, 50), (None, 1), (None, 1)])

    model.compile(loss=tf.keras.losses.MeanAbsoluteError(), loss_weights=[1., 0.0],
                  optimizer=tf.keras.optimizers.Adam(1e-3), metrics=['mae'])

    print(model.summary())

    e = ConvEncoder()