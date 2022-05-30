import numpy as np
from pyopenms import *

amino_acids = {'Lysine': 'K',
               'Alanine': 'A',
               'Glycine': 'G',
               'Valine': 'V',
               'Tyrosine': 'Y',
               'Arginine': 'R',
               'Glutamic Acid': 'E',
               'Phenylalanine': 'F',
               'Tryptophan': 'W',
               'Leucine': 'L',
               'Threonine': 'T',
               'Cysteine': 'C',
               'Serine': 'S',
               'Glutamine': 'Q',
               'Methionine': 'M',
               'Isoleucine': 'I',
               'Asparagine': 'N',
               'Proline': 'P',
               'Histidine': 'H',
               'Aspartic Acid': 'D'}

VARIANT_DICT = {'L': ['L'], 'E': ['E'], 'S': ['S', 'S-<PH>'], 'A': ['A'], 'V': ['V'], 'D': ['D'], 'G': ['G'],
                '<END>': ['<END>'], 'P': ['P'], '<START>': ['<START>', '<START>-<AC>'], 'T': ['T', 'T-<PH>'],
                'I': ['I'], 'Q': ['Q'], 'K': ['K', 'K-<AC>'], 'N': ['N'], 'R': ['R'], 'F': ['F'], 'H': ['H'],
                'Y': ['Y', 'Y-<PH>'], 'M': ['M', 'M-<OX>'],
                'W': ['W'], 'C': ['C', 'C-<CY>', 'C-<CM>'], 'C-<CM>': ['C', 'C-<CY>', 'C-<CM>']}

VARIANT_DICT_R = {'L': ['L'], 'E': ['E'], 'S': ['S', 'S-<PH>'], 'A': ['A'], 'V': ['V'], 'D': ['D'], 'G': ['G'],
                  '<END>': ['<END>'], 'P': ['P'], '<START>': ['<START>', '<START>-<AC>'], 'T': ['T', 'T-<PH>'],
                  'I': ['I'], 'Q': ['Q'], 'K': ['K'], 'N': ['N'], 'R': ['R'], 'F': ['F'], 'H': ['H'],
                  'Y': ['Y', 'Y-<PH>'], 'M': ['M', 'M-<OX>'],
                  'W': ['W'], 'C-<CM>': ['C-<CM>']}

MASS_PROTON = 1.007276466583

MODIFICATIONS_MZ = {'<AC>': 42.010565, '<OX>': 15.994915, '<CM>': 57.021464, '<PH>': 79.966331, '<CY>': 0}


def calculate_mz(sequence, charge):
    """
    :param sequence:
    :param charge:
    :return:
    """
    c_dict = {'<AC>': 0, '<OX>': 0, '<CM>': 0, '<PH>': 0, '<CY>': 0}
    seq = ''

    first, last = sequence[0], sequence[-1]

    if first.find('<AC>') != -1:
        c_dict['<AC>'] += 1

    for char in sequence[1:-1]:

        if len(char) == 1:
            seq += char

        else:
            first, last = char.split('-')
            c_dict[last] += 1
            seq += first

    vanilla_mass = AASequence.fromString(seq).getMonoWeight()

    for key, value in c_dict.items():
        vanilla_mass += value * MODIFICATIONS_MZ[key]

    return seq, c_dict, (vanilla_mass + charge * MASS_PROTON) / charge


def reduced_mobility_to_ccs(one_over_k0, mz, charge, mass_gas=28.013, temp=31.85, t_diff=273.15):
    """
    convert reduced ion mobility (1/k0) to CCS
    :param one_over_k0: reduced ion mobility
    :param charge: charge state of the ion
    :param mz: mass-over-charge of the ion
    :param mass_gas: mass of drift gas
    :param temp: temperature of the drift gas in C°
    :param t_diff: factor to translate from C° to K
    """
    SUMMARY_CONSTANT = 18509.8632163405
    reduced_mass = (mz * charge * mass_gas) / (mz * charge + mass_gas)
    return (SUMMARY_CONSTANT * charge) / (np.sqrt(reduced_mass * (temp + t_diff)) * 1 / one_over_k0)
