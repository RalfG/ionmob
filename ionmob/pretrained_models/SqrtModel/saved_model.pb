��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
PartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
-
Sqrt
x"T
y"T"
Ttype:

2
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring �
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.6.02v2.6.0-rc2-32-g919f693420e8��
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
f
ConstConst*
_output_shapes

:*
dtype0*)
value B"    �oA�[�AT��A
h
Const_1Const*
_output_shapes

:*
dtype0*)
value B"    ��J?�9�BM�1C

NoOpNoOp
�	
Const_2Const"/device:CPU:0*
_output_shapes
: *
dtype0*�	
value�	B�	 B�
�

sqrt_layer
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
R
trainable_variables
	regularization_losses

	variables
	keras_api
 
 
 
 
�
metrics
trainable_variables
layer_regularization_losses
non_trainable_variables
regularization_losses

layers
	variables
layer_metrics
 
 
 
 
�
metrics
trainable_variables
layer_regularization_losses
non_trainable_variables
	regularization_losses

layers

	variables
layer_metrics

0
1
 
 

0
 
 
 
 
 
 
4
	total
	count
	variables
	keras_api
D
	total
	count

_fn_kwargs
	variables
 	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

0
1

	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

	variables
z
serving_default_input_1Placeholder*'
_output_shapes
:���������*
dtype0*
shape:���������
z
serving_default_input_2Placeholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
PartitionedCallPartitionedCallserving_default_input_1serving_default_input_2ConstConst_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *+
f&R$
"__inference_signature_wrapper_1051
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCallStatefulPartitionedCallsaver_filenametotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOpConst_2*
Tin

2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *&
f!R
__inference__traced_save_1141
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenametotalcounttotal_1count_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *)
f$R"
 __inference__traced_restore_1163��
�
�
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1077
inputs_0
inputs_1%
!project_to_initial_sqrt_ccs_mul_x%
!project_to_initial_sqrt_ccs_add_y
identity�
 project_to_initial_sqrt_ccs/SqrtSqrtinputs_0*
T0*'
_output_shapes
:���������2"
 project_to_initial_sqrt_ccs/Sqrt�
project_to_initial_sqrt_ccs/mulMul!project_to_initial_sqrt_ccs_mul_x$project_to_initial_sqrt_ccs/Sqrt:y:0*
T0*'
_output_shapes
:���������2!
project_to_initial_sqrt_ccs/mul�
project_to_initial_sqrt_ccs/addAddV2#project_to_initial_sqrt_ccs/mul:z:0!project_to_initial_sqrt_ccs_add_y*
T0*'
_output_shapes
:���������2!
project_to_initial_sqrt_ccs/add�
#project_to_initial_sqrt_ccs/SqueezeSqueezeinputs_1*
T0*
_output_shapes
:2%
#project_to_initial_sqrt_ccs/Squeeze�
!project_to_initial_sqrt_ccs/mul_1Mul#project_to_initial_sqrt_ccs/add:z:0,project_to_initial_sqrt_ccs/Squeeze:output:0*
T0*
_output_shapes
:2#
!project_to_initial_sqrt_ccs/mul_1�
1project_to_initial_sqrt_ccs/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :23
1project_to_initial_sqrt_ccs/Sum/reduction_indices�
project_to_initial_sqrt_ccs/SumSum%project_to_initial_sqrt_ccs/mul_1:z:0:project_to_initial_sqrt_ccs/Sum/reduction_indices:output:0*
T0*
_output_shapes
:2!
project_to_initial_sqrt_ccs/Sum�
*project_to_initial_sqrt_ccs/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2,
*project_to_initial_sqrt_ccs/ExpandDims/dim�
&project_to_initial_sqrt_ccs/ExpandDims
ExpandDims(project_to_initial_sqrt_ccs/Sum:output:03project_to_initial_sqrt_ccs/ExpandDims/dim:output:0*
T0*
_output_shapes
:2(
&project_to_initial_sqrt_ccs/ExpandDimst
IdentityIdentity/project_to_initial_sqrt_ccs/ExpandDims:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1:$ 

_output_shapes

::$ 

_output_shapes

:
�
h
"__inference_signature_wrapper_1051
input_1
input_2
unknown
	unknown_0
identity�
PartitionedCallPartitionedCallinput_1input_2unknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *'
f"R 
__inference__wrapped_model_9692
PartitionedCall]
IdentityIdentityPartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::P L
'
_output_shapes
:���������
!
_user_specified_name	input_1:PL
'
_output_shapes
:���������
!
_user_specified_name	input_2:$ 

_output_shapes

::$ 

_output_shapes

:
�
o
)__inference_sqrt_model_layer_call_fn_1008
input_1
input_2
unknown
	unknown_0
identity�
PartitionedCallPartitionedCallinput_1input_2unknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *M
fHRF
D__inference_sqrt_model_layer_call_and_return_conditional_losses_10012
PartitionedCall]
IdentityIdentityPartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::P L
'
_output_shapes
:���������
!
_user_specified_name	input_1:PL
'
_output_shapes
:���������
!
_user_specified_name	input_2:$ 

_output_shapes

::$ 

_output_shapes

:
�	
�
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1039
input_1
input_2$
 project_to_initial_sqrt_ccs_1033$
 project_to_initial_sqrt_ccs_1035
identity�
+project_to_initial_sqrt_ccs/PartitionedCallPartitionedCallinput_1input_2 project_to_initial_sqrt_ccs_1033 project_to_initial_sqrt_ccs_1035*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *]
fXRV
T__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_9942-
+project_to_initial_sqrt_ccs/PartitionedCally
IdentityIdentity4project_to_initial_sqrt_ccs/PartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::P L
'
_output_shapes
:���������
!
_user_specified_name	input_1:PL
'
_output_shapes
:���������
!
_user_specified_name	input_2:$ 

_output_shapes

::$ 

_output_shapes

:
�
�
T__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_994

inputs
inputs_1	
mul_x	
add_y
identityN
SqrtSqrtinputs*
T0*'
_output_shapes
:���������2
SqrtT
mulMulmul_xSqrt:y:0*
T0*'
_output_shapes
:���������2
mulU
addAddV2mul:z:0add_y*
T0*'
_output_shapes
:���������2
addJ
SqueezeSqueezeinputs_1*
T0*
_output_shapes
:2	
SqueezeS
mul_1Muladd:z:0Squeeze:output:0*
T0*
_output_shapes
:2
mul_1p
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Sum/reduction_indices_
SumSum	mul_1:z:0Sum/reduction_indices:output:0*
T0*
_output_shapes
:2
Sumb
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims/dimp

ExpandDims
ExpandDimsSum:output:0ExpandDims/dim:output:0*
T0*
_output_shapes
:2

ExpandDimsX
IdentityIdentityExpandDims:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs:$ 

_output_shapes

::$ 

_output_shapes

:
�
�
 __inference__traced_restore_1163
file_prefix 
assignvariableop_total: "
assignvariableop_1_count: $
assignvariableop_2_total_1: $
assignvariableop_3_count_1: 

identity_5��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_2�AssignVariableOp_3�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B B 2
RestoreV2/shape_and_slices�
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*(
_output_shapes
:::::*
dtypes	
22
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity�
AssignVariableOpAssignVariableOpassignvariableop_totalIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1�
AssignVariableOp_1AssignVariableOpassignvariableop_1_countIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2�
AssignVariableOp_2AssignVariableOpassignvariableop_2_total_1Identity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3�
AssignVariableOp_3AssignVariableOpassignvariableop_3_count_1Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp�

Identity_4Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_4c

Identity_5IdentityIdentity_4:output:0^NoOp_1*
T0*
_output_shapes
: 2

Identity_5�
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"!

identity_5Identity_5:output:0*
_input_shapes

: : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_3:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
:__inference_project_to_initial_sqrt_ccs_layer_call_fn_1087
inputs_0
inputs_1
unknown
	unknown_0
identity�
PartitionedCallPartitionedCallinputs_0inputs_1unknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *]
fXRV
T__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_9942
PartitionedCall]
IdentityIdentityPartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1:$ 

_output_shapes

::$ 

_output_shapes

:
�
�
__inference__wrapped_model_969
input_1
input_20
,sqrt_model_project_to_initial_sqrt_ccs_mul_x0
,sqrt_model_project_to_initial_sqrt_ccs_add_y
identity�
+sqrt_model/project_to_initial_sqrt_ccs/SqrtSqrtinput_1*
T0*'
_output_shapes
:���������2-
+sqrt_model/project_to_initial_sqrt_ccs/Sqrt�
*sqrt_model/project_to_initial_sqrt_ccs/mulMul,sqrt_model_project_to_initial_sqrt_ccs_mul_x/sqrt_model/project_to_initial_sqrt_ccs/Sqrt:y:0*
T0*'
_output_shapes
:���������2,
*sqrt_model/project_to_initial_sqrt_ccs/mul�
*sqrt_model/project_to_initial_sqrt_ccs/addAddV2.sqrt_model/project_to_initial_sqrt_ccs/mul:z:0,sqrt_model_project_to_initial_sqrt_ccs_add_y*
T0*'
_output_shapes
:���������2,
*sqrt_model/project_to_initial_sqrt_ccs/add�
.sqrt_model/project_to_initial_sqrt_ccs/SqueezeSqueezeinput_2*
T0*
_output_shapes
:20
.sqrt_model/project_to_initial_sqrt_ccs/Squeeze�
,sqrt_model/project_to_initial_sqrt_ccs/mul_1Mul.sqrt_model/project_to_initial_sqrt_ccs/add:z:07sqrt_model/project_to_initial_sqrt_ccs/Squeeze:output:0*
T0*
_output_shapes
:2.
,sqrt_model/project_to_initial_sqrt_ccs/mul_1�
<sqrt_model/project_to_initial_sqrt_ccs/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2>
<sqrt_model/project_to_initial_sqrt_ccs/Sum/reduction_indices�
*sqrt_model/project_to_initial_sqrt_ccs/SumSum0sqrt_model/project_to_initial_sqrt_ccs/mul_1:z:0Esqrt_model/project_to_initial_sqrt_ccs/Sum/reduction_indices:output:0*
T0*
_output_shapes
:2,
*sqrt_model/project_to_initial_sqrt_ccs/Sum�
5sqrt_model/project_to_initial_sqrt_ccs/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :27
5sqrt_model/project_to_initial_sqrt_ccs/ExpandDims/dim�
1sqrt_model/project_to_initial_sqrt_ccs/ExpandDims
ExpandDims3sqrt_model/project_to_initial_sqrt_ccs/Sum:output:0>sqrt_model/project_to_initial_sqrt_ccs/ExpandDims/dim:output:0*
T0*
_output_shapes
:23
1sqrt_model/project_to_initial_sqrt_ccs/ExpandDims
IdentityIdentity:sqrt_model/project_to_initial_sqrt_ccs/ExpandDims:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::P L
'
_output_shapes
:���������
!
_user_specified_name	input_1:PL
'
_output_shapes
:���������
!
_user_specified_name	input_2:$ 

_output_shapes

::$ 

_output_shapes

:
�
�
__inference__traced_save_1141
file_prefix$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop
savev2_const_2

identity_1��MergeV2Checkpoints�
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard�
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename�
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B B 2
SaveV2/shape_and_slices�
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0 savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableopsavev2_const_2"/device:CPU:0*
_output_shapes
 *
dtypes	
22
SaveV2�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*
_input_shapes
: : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: 
�	
�
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1001

inputs
inputs_1#
project_to_initial_sqrt_ccs_995#
project_to_initial_sqrt_ccs_997
identity�
+project_to_initial_sqrt_ccs/PartitionedCallPartitionedCallinputsinputs_1project_to_initial_sqrt_ccs_995project_to_initial_sqrt_ccs_997*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *]
fXRV
T__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_9942-
+project_to_initial_sqrt_ccs/PartitionedCally
IdentityIdentity4project_to_initial_sqrt_ccs/PartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs:$ 

_output_shapes

::$ 

_output_shapes

:
�
q
)__inference_sqrt_model_layer_call_fn_1061
inputs_0
inputs_1
unknown
	unknown_0
identity�
PartitionedCallPartitionedCallinputs_0inputs_1unknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
:* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *M
fHRF
D__inference_sqrt_model_layer_call_and_return_conditional_losses_10012
PartitionedCall]
IdentityIdentityPartitionedCall:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1:$ 

_output_shapes

::$ 

_output_shapes

:
�
�
U__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_1103
inputs_0
inputs_1	
mul_x	
add_y
identityP
SqrtSqrtinputs_0*
T0*'
_output_shapes
:���������2
SqrtT
mulMulmul_xSqrt:y:0*
T0*'
_output_shapes
:���������2
mulU
addAddV2mul:z:0add_y*
T0*'
_output_shapes
:���������2
addJ
SqueezeSqueezeinputs_1*
T0*
_output_shapes
:2	
SqueezeS
mul_1Muladd:z:0Squeeze:output:0*
T0*
_output_shapes
:2
mul_1p
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Sum/reduction_indices_
SumSum	mul_1:z:0Sum/reduction_indices:output:0*
T0*
_output_shapes
:2
Sumb
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims/dimp

ExpandDims
ExpandDimsSum:output:0ExpandDims/dim:output:0*
T0*
_output_shapes
:2

ExpandDimsX
IdentityIdentityExpandDims:output:0*
T0*
_output_shapes
:2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������:::Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1:$ 

_output_shapes

::$ 

_output_shapes

:"�J
saver_filename:0StatefulPartitionedCall:0StatefulPartitionedCall_18"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
;
input_10
serving_default_input_1:0���������
;
input_20
serving_default_input_2:0���������%
output_1
PartitionedCall:0tensorflow/serving/predict:�'
�

sqrt_layer
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
!__call__
*"&call_and_return_all_conditional_losses
#_default_save_signature"
_tf_keras_model
�
trainable_variables
	regularization_losses

	variables
	keras_api
$__call__
*%&call_and_return_all_conditional_losses"
_tf_keras_layer
"
	optimizer
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
metrics
trainable_variables
layer_regularization_losses
non_trainable_variables
regularization_losses

layers
	variables
layer_metrics
!__call__
#_default_save_signature
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
,
&serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
metrics
trainable_variables
layer_regularization_losses
non_trainable_variables
	regularization_losses

layers

	variables
layer_metrics
$__call__
*%&call_and_return_all_conditional_losses
&%"call_and_return_conditional_losses"
_generic_user_object
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	total
	count
	variables
	keras_api"
_tf_keras_metric
^
	total
	count

_fn_kwargs
	variables
 	keras_api"
_tf_keras_metric
:  (2total
:  (2count
.
0
1"
trackable_list_wrapper
-
	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
0
1"
trackable_list_wrapper
-
	variables"
_generic_user_object
�2�
)__inference_sqrt_model_layer_call_fn_1008
)__inference_sqrt_model_layer_call_fn_1061�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1077
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1039�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
__inference__wrapped_model_969input_1input_2"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
:__inference_project_to_initial_sqrt_ccs_layer_call_fn_1087�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
U__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_1103�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference_signature_wrapper_1051input_1input_2"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
	J
Const
J	
Const_1�
__inference__wrapped_model_969�'(X�U
N�K
I�F
!�
input_1���������
!�
input_2���������
� "$�!

output_1�
output_1�
U__inference_project_to_initial_sqrt_ccs_layer_call_and_return_conditional_losses_1103x'(Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "�
�	
0
� �
:__inference_project_to_initial_sqrt_ccs_layer_call_fn_1087k'(Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "	��
"__inference_signature_wrapper_1051�'(i�f
� 
_�\
,
input_1!�
input_1���������
,
input_2!�
input_2���������"$�!

output_1�
output_1�
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1039v'(X�U
N�K
I�F
!�
input_1���������
!�
input_2���������
� "�
�	
0
� �
D__inference_sqrt_model_layer_call_and_return_conditional_losses_1077x'(Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "�
�	
0
� �
)__inference_sqrt_model_layer_call_fn_1008i'(X�U
N�K
I�F
!�
input_1���������
!�
input_2���������
� "	��
)__inference_sqrt_model_layer_call_fn_1061k'(Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "	�