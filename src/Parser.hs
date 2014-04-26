{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Lexer

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

action_0 (17) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail

action_1 (17) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (17) = happyShift action_7
action_2 (6) = happyGoto action_6
action_2 _ = happyReduce_4

action_3 (51) = happyShift action_5
action_3 _ = happyFail

action_4 (53) = happyAccept
action_4 _ = happyFail

action_5 (49) = happyShift action_9
action_5 _ = happyFail

action_6 _ = happyReduce_1

action_7 (51) = happyShift action_8
action_7 _ = happyFail

action_8 (49) = happyShift action_11
action_8 _ = happyFail

action_9 (18) = happyShift action_10
action_9 _ = happyFail

action_10 (19) = happyShift action_13
action_10 _ = happyFail

action_11 (7) = happyGoto action_12
action_11 _ = happyReduce_5

action_12 (18) = happyShift action_17
action_12 (31) = happyShift action_18
action_12 (32) = happyShift action_19
action_12 (51) = happyShift action_20
action_12 (8) = happyGoto action_15
action_12 (10) = happyGoto action_16
action_12 _ = happyReduce_9

action_13 (29) = happyShift action_14
action_13 _ = happyFail

action_14 (20) = happyShift action_25
action_14 _ = happyFail

action_15 (50) = happyShift action_24
action_15 _ = happyFail

action_16 (51) = happyShift action_23
action_16 _ = happyFail

action_17 (31) = happyShift action_18
action_17 (32) = happyShift action_19
action_17 (51) = happyShift action_20
action_17 (10) = happyGoto action_22
action_17 _ = happyFail

action_18 (47) = happyShift action_21
action_18 _ = happyReduce_15

action_19 _ = happyReduce_14

action_20 _ = happyReduce_16

action_21 (48) = happyShift action_31
action_21 _ = happyFail

action_22 (20) = happyShift action_29
action_22 (51) = happyShift action_30
action_22 _ = happyFail

action_23 (44) = happyShift action_28
action_23 _ = happyFail

action_24 (17) = happyShift action_7
action_24 (6) = happyGoto action_27
action_24 _ = happyReduce_4

action_25 (45) = happyShift action_26
action_25 _ = happyFail

action_26 (30) = happyShift action_34
action_26 _ = happyFail

action_27 _ = happyReduce_3

action_28 _ = happyReduce_6

action_29 (45) = happyShift action_33
action_29 _ = happyFail

action_30 (45) = happyShift action_32
action_30 _ = happyFail

action_31 _ = happyReduce_13

action_32 (31) = happyShift action_18
action_32 (32) = happyShift action_19
action_32 (51) = happyShift action_20
action_32 (9) = happyGoto action_38
action_32 (10) = happyGoto action_37
action_32 _ = happyReduce_12

action_33 (31) = happyShift action_18
action_33 (32) = happyShift action_19
action_33 (51) = happyShift action_20
action_33 (9) = happyGoto action_36
action_33 (10) = happyGoto action_37
action_33 _ = happyReduce_12

action_34 (47) = happyShift action_35
action_34 _ = happyFail

action_35 (48) = happyShift action_42
action_35 _ = happyFail

action_36 (46) = happyShift action_41
action_36 _ = happyFail

action_37 (51) = happyShift action_40
action_37 _ = happyFail

action_38 (46) = happyShift action_39
action_38 _ = happyFail

action_39 (49) = happyShift action_46
action_39 _ = happyFail

action_40 (42) = happyShift action_45
action_40 _ = happyReduce_11

action_41 (49) = happyShift action_44
action_41 _ = happyFail

action_42 (51) = happyShift action_43
action_42 _ = happyFail

action_43 (46) = happyShift action_50
action_43 _ = happyFail

action_44 (7) = happyGoto action_49
action_44 _ = happyReduce_5

action_45 (31) = happyShift action_18
action_45 (32) = happyShift action_19
action_45 (51) = happyShift action_20
action_45 (9) = happyGoto action_48
action_45 (10) = happyGoto action_37
action_45 _ = happyReduce_12

action_46 (7) = happyGoto action_47
action_46 _ = happyReduce_5

action_47 (23) = happyShift action_54
action_47 (25) = happyShift action_55
action_47 (26) = happyShift action_56
action_47 (31) = happyShift action_18
action_47 (32) = happyShift action_19
action_47 (49) = happyShift action_57
action_47 (51) = happyShift action_58
action_47 (10) = happyGoto action_16
action_47 (11) = happyGoto action_52
action_47 (12) = happyGoto action_59
action_47 _ = happyReduce_24

action_48 _ = happyReduce_10

action_49 (23) = happyShift action_54
action_49 (25) = happyShift action_55
action_49 (26) = happyShift action_56
action_49 (31) = happyShift action_18
action_49 (32) = happyShift action_19
action_49 (49) = happyShift action_57
action_49 (51) = happyShift action_58
action_49 (10) = happyGoto action_16
action_49 (11) = happyGoto action_52
action_49 (12) = happyGoto action_53
action_49 _ = happyReduce_24

action_50 (49) = happyShift action_51
action_50 _ = happyFail

action_51 (7) = happyGoto action_70
action_51 _ = happyReduce_5

action_52 (23) = happyShift action_54
action_52 (25) = happyShift action_55
action_52 (26) = happyShift action_56
action_52 (49) = happyShift action_57
action_52 (51) = happyShift action_64
action_52 (11) = happyGoto action_52
action_52 (12) = happyGoto action_69
action_52 _ = happyReduce_24

action_53 (22) = happyShift action_68
action_53 _ = happyFail

action_54 (45) = happyShift action_67
action_54 _ = happyFail

action_55 (45) = happyShift action_66
action_55 _ = happyFail

action_56 (45) = happyShift action_65
action_56 _ = happyFail

action_57 (23) = happyShift action_54
action_57 (25) = happyShift action_55
action_57 (26) = happyShift action_56
action_57 (49) = happyShift action_57
action_57 (51) = happyShift action_64
action_57 (11) = happyGoto action_52
action_57 (12) = happyGoto action_63
action_57 _ = happyReduce_24

action_58 (41) = happyShift action_61
action_58 (47) = happyShift action_62
action_58 _ = happyReduce_16

action_59 (22) = happyShift action_60
action_59 _ = happyFail

action_60 (21) = happyShift action_74
action_60 (28) = happyShift action_75
action_60 (33) = happyShift action_76
action_60 (34) = happyShift action_77
action_60 (35) = happyShift action_78
action_60 (45) = happyShift action_79
action_60 (51) = happyShift action_80
action_60 (52) = happyShift action_81
action_60 (13) = happyGoto action_88
action_60 (14) = happyGoto action_73
action_60 _ = happyFail

action_61 (21) = happyShift action_74
action_61 (28) = happyShift action_75
action_61 (33) = happyShift action_76
action_61 (34) = happyShift action_77
action_61 (35) = happyShift action_78
action_61 (45) = happyShift action_79
action_61 (51) = happyShift action_80
action_61 (52) = happyShift action_81
action_61 (13) = happyGoto action_87
action_61 (14) = happyGoto action_73
action_61 _ = happyFail

action_62 (21) = happyShift action_74
action_62 (28) = happyShift action_75
action_62 (33) = happyShift action_76
action_62 (34) = happyShift action_77
action_62 (35) = happyShift action_78
action_62 (45) = happyShift action_79
action_62 (51) = happyShift action_80
action_62 (52) = happyShift action_81
action_62 (13) = happyGoto action_86
action_62 (14) = happyGoto action_73
action_62 _ = happyFail

action_63 (50) = happyShift action_85
action_63 _ = happyFail

action_64 (41) = happyShift action_61
action_64 (47) = happyShift action_62
action_64 _ = happyFail

action_65 (21) = happyShift action_74
action_65 (28) = happyShift action_75
action_65 (33) = happyShift action_76
action_65 (34) = happyShift action_77
action_65 (35) = happyShift action_78
action_65 (45) = happyShift action_79
action_65 (51) = happyShift action_80
action_65 (52) = happyShift action_81
action_65 (13) = happyGoto action_84
action_65 (14) = happyGoto action_73
action_65 _ = happyFail

action_66 (21) = happyShift action_74
action_66 (28) = happyShift action_75
action_66 (33) = happyShift action_76
action_66 (34) = happyShift action_77
action_66 (35) = happyShift action_78
action_66 (45) = happyShift action_79
action_66 (51) = happyShift action_80
action_66 (52) = happyShift action_81
action_66 (13) = happyGoto action_83
action_66 (14) = happyGoto action_73
action_66 _ = happyFail

action_67 (21) = happyShift action_74
action_67 (28) = happyShift action_75
action_67 (33) = happyShift action_76
action_67 (34) = happyShift action_77
action_67 (35) = happyShift action_78
action_67 (45) = happyShift action_79
action_67 (51) = happyShift action_80
action_67 (52) = happyShift action_81
action_67 (13) = happyGoto action_82
action_67 (14) = happyGoto action_73
action_67 _ = happyFail

action_68 (21) = happyShift action_74
action_68 (28) = happyShift action_75
action_68 (33) = happyShift action_76
action_68 (34) = happyShift action_77
action_68 (35) = happyShift action_78
action_68 (45) = happyShift action_79
action_68 (51) = happyShift action_80
action_68 (52) = happyShift action_81
action_68 (13) = happyGoto action_72
action_68 (14) = happyGoto action_73
action_68 _ = happyFail

action_69 _ = happyReduce_23

action_70 (23) = happyShift action_54
action_70 (25) = happyShift action_55
action_70 (26) = happyShift action_56
action_70 (31) = happyShift action_18
action_70 (32) = happyShift action_19
action_70 (49) = happyShift action_57
action_70 (51) = happyShift action_58
action_70 (10) = happyGoto action_16
action_70 (11) = happyGoto action_52
action_70 (12) = happyGoto action_71
action_70 _ = happyReduce_24

action_71 (50) = happyShift action_107
action_71 _ = happyFail

action_72 (36) = happyShift action_89
action_72 (37) = happyShift action_90
action_72 (38) = happyShift action_91
action_72 (39) = happyShift action_92
action_72 (40) = happyShift action_93
action_72 (44) = happyShift action_106
action_72 _ = happyFail

action_73 (43) = happyShift action_104
action_73 (47) = happyShift action_105
action_73 _ = happyReduce_34

action_74 (31) = happyShift action_102
action_74 (51) = happyShift action_103
action_74 _ = happyFail

action_75 _ = happyReduce_37

action_76 _ = happyReduce_31

action_77 _ = happyReduce_32

action_78 (21) = happyShift action_74
action_78 (28) = happyShift action_75
action_78 (33) = happyShift action_76
action_78 (34) = happyShift action_77
action_78 (35) = happyShift action_78
action_78 (45) = happyShift action_79
action_78 (51) = happyShift action_80
action_78 (52) = happyShift action_81
action_78 (13) = happyGoto action_101
action_78 (14) = happyGoto action_73
action_78 _ = happyFail

action_79 (21) = happyShift action_74
action_79 (28) = happyShift action_75
action_79 (33) = happyShift action_76
action_79 (34) = happyShift action_77
action_79 (35) = happyShift action_78
action_79 (45) = happyShift action_79
action_79 (51) = happyShift action_80
action_79 (52) = happyShift action_81
action_79 (13) = happyGoto action_100
action_79 (14) = happyGoto action_73
action_79 _ = happyFail

action_80 _ = happyReduce_36

action_81 _ = happyReduce_30

action_82 (36) = happyShift action_89
action_82 (37) = happyShift action_90
action_82 (38) = happyShift action_91
action_82 (39) = happyShift action_92
action_82 (40) = happyShift action_93
action_82 (46) = happyShift action_99
action_82 _ = happyFail

action_83 (36) = happyShift action_89
action_83 (37) = happyShift action_90
action_83 (38) = happyShift action_91
action_83 (39) = happyShift action_92
action_83 (40) = happyShift action_93
action_83 (46) = happyShift action_98
action_83 _ = happyFail

action_84 (36) = happyShift action_89
action_84 (37) = happyShift action_90
action_84 (38) = happyShift action_91
action_84 (39) = happyShift action_92
action_84 (40) = happyShift action_93
action_84 (46) = happyShift action_97
action_84 _ = happyFail

action_85 _ = happyReduce_17

action_86 (36) = happyShift action_89
action_86 (37) = happyShift action_90
action_86 (38) = happyShift action_91
action_86 (39) = happyShift action_92
action_86 (40) = happyShift action_93
action_86 (48) = happyShift action_96
action_86 _ = happyFail

action_87 (36) = happyShift action_89
action_87 (37) = happyShift action_90
action_87 (38) = happyShift action_91
action_87 (39) = happyShift action_92
action_87 (40) = happyShift action_93
action_87 (44) = happyShift action_95
action_87 _ = happyFail

action_88 (36) = happyShift action_89
action_88 (37) = happyShift action_90
action_88 (38) = happyShift action_91
action_88 (39) = happyShift action_92
action_88 (40) = happyShift action_93
action_88 (44) = happyShift action_94
action_88 _ = happyFail

action_89 (21) = happyShift action_74
action_89 (28) = happyShift action_75
action_89 (33) = happyShift action_76
action_89 (34) = happyShift action_77
action_89 (35) = happyShift action_78
action_89 (45) = happyShift action_79
action_89 (51) = happyShift action_80
action_89 (52) = happyShift action_81
action_89 (13) = happyGoto action_126
action_89 (14) = happyGoto action_73
action_89 _ = happyFail

action_90 (21) = happyShift action_74
action_90 (28) = happyShift action_75
action_90 (33) = happyShift action_76
action_90 (34) = happyShift action_77
action_90 (35) = happyShift action_78
action_90 (45) = happyShift action_79
action_90 (51) = happyShift action_80
action_90 (52) = happyShift action_81
action_90 (13) = happyGoto action_125
action_90 (14) = happyGoto action_73
action_90 _ = happyFail

action_91 (21) = happyShift action_74
action_91 (28) = happyShift action_75
action_91 (33) = happyShift action_76
action_91 (34) = happyShift action_77
action_91 (35) = happyShift action_78
action_91 (45) = happyShift action_79
action_91 (51) = happyShift action_80
action_91 (52) = happyShift action_81
action_91 (13) = happyGoto action_124
action_91 (14) = happyGoto action_73
action_91 _ = happyFail

action_92 (21) = happyShift action_74
action_92 (28) = happyShift action_75
action_92 (33) = happyShift action_76
action_92 (34) = happyShift action_77
action_92 (35) = happyShift action_78
action_92 (45) = happyShift action_79
action_92 (51) = happyShift action_80
action_92 (52) = happyShift action_81
action_92 (13) = happyGoto action_123
action_92 (14) = happyGoto action_73
action_92 _ = happyFail

action_93 (21) = happyShift action_74
action_93 (28) = happyShift action_75
action_93 (33) = happyShift action_76
action_93 (34) = happyShift action_77
action_93 (35) = happyShift action_78
action_93 (45) = happyShift action_79
action_93 (51) = happyShift action_80
action_93 (52) = happyShift action_81
action_93 (13) = happyGoto action_122
action_93 (14) = happyGoto action_73
action_93 _ = happyFail

action_94 (50) = happyShift action_121
action_94 _ = happyFail

action_95 _ = happyReduce_21

action_96 (41) = happyShift action_120
action_96 _ = happyFail

action_97 (44) = happyShift action_119
action_97 _ = happyFail

action_98 (23) = happyShift action_54
action_98 (25) = happyShift action_55
action_98 (26) = happyShift action_56
action_98 (49) = happyShift action_57
action_98 (51) = happyShift action_64
action_98 (11) = happyGoto action_118
action_98 _ = happyFail

action_99 (23) = happyShift action_54
action_99 (25) = happyShift action_55
action_99 (26) = happyShift action_56
action_99 (49) = happyShift action_57
action_99 (51) = happyShift action_64
action_99 (11) = happyGoto action_117
action_99 _ = happyFail

action_100 (36) = happyShift action_89
action_100 (37) = happyShift action_90
action_100 (38) = happyShift action_91
action_100 (39) = happyShift action_92
action_100 (40) = happyShift action_93
action_100 (46) = happyShift action_116
action_100 _ = happyFail

action_101 _ = happyReduce_33

action_102 (47) = happyShift action_115
action_102 _ = happyFail

action_103 (45) = happyShift action_114
action_103 _ = happyFail

action_104 (20) = happyShift action_111
action_104 (27) = happyShift action_112
action_104 (51) = happyShift action_113
action_104 _ = happyFail

action_105 (21) = happyShift action_74
action_105 (28) = happyShift action_75
action_105 (33) = happyShift action_76
action_105 (34) = happyShift action_77
action_105 (35) = happyShift action_78
action_105 (45) = happyShift action_79
action_105 (51) = happyShift action_80
action_105 (52) = happyShift action_81
action_105 (13) = happyGoto action_110
action_105 (14) = happyGoto action_73
action_105 _ = happyFail

action_106 (50) = happyShift action_109
action_106 _ = happyFail

action_107 (50) = happyShift action_108
action_107 _ = happyFail

action_108 _ = happyReduce_2

action_109 (18) = happyShift action_17
action_109 (8) = happyGoto action_135
action_109 _ = happyReduce_9

action_110 (36) = happyShift action_89
action_110 (37) = happyShift action_90
action_110 (38) = happyShift action_91
action_110 (39) = happyShift action_92
action_110 (40) = happyShift action_93
action_110 (48) = happyShift action_134
action_110 _ = happyFail

action_111 (45) = happyShift action_133
action_111 _ = happyFail

action_112 _ = happyReduce_41

action_113 (45) = happyShift action_132
action_113 _ = happyFail

action_114 (46) = happyShift action_131
action_114 _ = happyFail

action_115 (21) = happyShift action_74
action_115 (28) = happyShift action_75
action_115 (33) = happyShift action_76
action_115 (34) = happyShift action_77
action_115 (35) = happyShift action_78
action_115 (45) = happyShift action_79
action_115 (51) = happyShift action_80
action_115 (52) = happyShift action_81
action_115 (13) = happyGoto action_130
action_115 (14) = happyGoto action_73
action_115 _ = happyFail

action_116 _ = happyReduce_35

action_117 (24) = happyShift action_129
action_117 _ = happyFail

action_118 _ = happyReduce_19

action_119 _ = happyReduce_20

action_120 (21) = happyShift action_74
action_120 (28) = happyShift action_75
action_120 (33) = happyShift action_76
action_120 (34) = happyShift action_77
action_120 (35) = happyShift action_78
action_120 (45) = happyShift action_79
action_120 (51) = happyShift action_80
action_120 (52) = happyShift action_81
action_120 (13) = happyGoto action_128
action_120 (14) = happyGoto action_73
action_120 _ = happyFail

action_121 (18) = happyShift action_17
action_121 (8) = happyGoto action_127
action_121 _ = happyReduce_9

action_122 _ = happyReduce_28

action_123 (40) = happyShift action_93
action_123 _ = happyReduce_27

action_124 (40) = happyShift action_93
action_124 _ = happyReduce_26

action_125 (37) = happyFail
action_125 (38) = happyShift action_91
action_125 (39) = happyShift action_92
action_125 (40) = happyShift action_93
action_125 _ = happyReduce_29

action_126 (37) = happyShift action_90
action_126 (38) = happyShift action_91
action_126 (39) = happyShift action_92
action_126 (40) = happyShift action_93
action_126 _ = happyReduce_25

action_127 _ = happyReduce_7

action_128 (36) = happyShift action_89
action_128 (37) = happyShift action_90
action_128 (38) = happyShift action_91
action_128 (39) = happyShift action_92
action_128 (40) = happyShift action_93
action_128 (44) = happyShift action_141
action_128 _ = happyFail

action_129 (23) = happyShift action_54
action_129 (25) = happyShift action_55
action_129 (26) = happyShift action_56
action_129 (49) = happyShift action_57
action_129 (51) = happyShift action_64
action_129 (11) = happyGoto action_140
action_129 _ = happyFail

action_130 (36) = happyShift action_89
action_130 (37) = happyShift action_90
action_130 (38) = happyShift action_91
action_130 (39) = happyShift action_92
action_130 (40) = happyShift action_93
action_130 (48) = happyShift action_139
action_130 _ = happyFail

action_131 _ = happyReduce_39

action_132 (21) = happyShift action_74
action_132 (28) = happyShift action_75
action_132 (33) = happyShift action_76
action_132 (34) = happyShift action_77
action_132 (35) = happyShift action_78
action_132 (45) = happyShift action_79
action_132 (51) = happyShift action_80
action_132 (52) = happyShift action_81
action_132 (13) = happyGoto action_136
action_132 (14) = happyGoto action_73
action_132 (15) = happyGoto action_138
action_132 _ = happyReduce_45

action_133 (21) = happyShift action_74
action_133 (28) = happyShift action_75
action_133 (33) = happyShift action_76
action_133 (34) = happyShift action_77
action_133 (35) = happyShift action_78
action_133 (45) = happyShift action_79
action_133 (51) = happyShift action_80
action_133 (52) = happyShift action_81
action_133 (13) = happyGoto action_136
action_133 (14) = happyGoto action_73
action_133 (15) = happyGoto action_137
action_133 _ = happyReduce_45

action_134 _ = happyReduce_40

action_135 _ = happyReduce_8

action_136 (36) = happyShift action_89
action_136 (37) = happyShift action_90
action_136 (38) = happyShift action_91
action_136 (39) = happyShift action_92
action_136 (40) = happyShift action_93
action_136 (42) = happyShift action_145
action_136 (16) = happyGoto action_144
action_136 _ = happyReduce_47

action_137 (46) = happyShift action_143
action_137 _ = happyFail

action_138 (46) = happyShift action_142
action_138 _ = happyFail

action_139 _ = happyReduce_38

action_140 _ = happyReduce_18

action_141 _ = happyReduce_22

action_142 _ = happyReduce_42

action_143 _ = happyReduce_43

action_144 _ = happyReduce_44

action_145 (21) = happyShift action_74
action_145 (28) = happyShift action_75
action_145 (33) = happyShift action_76
action_145 (34) = happyShift action_77
action_145 (35) = happyShift action_78
action_145 (45) = happyShift action_79
action_145 (51) = happyShift action_80
action_145 (52) = happyShift action_81
action_145 (13) = happyGoto action_146
action_145 (14) = happyGoto action_73
action_145 _ = happyFail

action_146 (36) = happyShift action_89
action_146 (37) = happyShift action_90
action_146 (38) = happyShift action_91
action_146 (39) = happyShift action_92
action_146 (40) = happyShift action_93
action_146 (42) = happyShift action_145
action_146 (16) = happyGoto action_147
action_146 _ = happyReduce_47

action_147 _ = happyReduce_46

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Fix . AProgram $ fixMap (happy_var_1 : happy_var_2)
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happyReduce 18 5 happyReduction_2
happyReduction_2 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_16) `HappyStk`
	(HappyAbsSyn7  happy_var_15) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_12)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (AClass happy_var_2 [] [Fix $ mainMethod happy_var_12 happy_var_15 happy_var_16]
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 7 6 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AClass happy_var_2 (fixMap happy_var_4) (fixMap happy_var_5) : happy_var_7
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happySpecReduce_0  7 happyReduction_5
happyReduction_5  =  HappyAbsSyn7
		 ([]
	)

happyReduce_6 = happyReduce 4 7 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_3)) `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (happy_var_1 ++ [AVar happy_var_2 happy_var_3]
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 14 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_14) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_11) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_9) `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_3)) `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AMethod happy_var_2 happy_var_3 (fixMap happy_var_5) (fixMap happy_var_8) (fixMap happy_var_9) (Fix happy_var_11) : happy_var_14
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 14 8 happyReduction_8
happyReduction_8 ((HappyAbsSyn8  happy_var_14) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_11) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_9) `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AMethod happy_var_2 "main" (fixMap happy_var_5) (fixMap happy_var_8) (fixMap happy_var_9) (Fix happy_var_11) : happy_var_14
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_0  8 happyReduction_9
happyReduction_9  =  HappyAbsSyn8
		 ([]
	)

happyReduce_10 = happyReduce 4 9 happyReduction_10
happyReduction_10 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AVar happy_var_1 happy_var_2 : happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 (HappyTerminal (TIdLiteral happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([AVar happy_var_1 happy_var_2]
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  9 happyReduction_12
happyReduction_12  =  HappyAbsSyn9
		 ([]
	)

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 _
	_
	_
	 =  HappyAbsSyn10
		 (TypeIntegerArray
	)

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn10
		 (TypeBoolean
	)

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (TypeInteger
	)

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn10
		 (TypeAppDefined happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (AStatScope (fixMap happy_var_2)
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 7 11 happyReduction_18
happyReduction_18 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AIf (Fix happy_var_3) (Fix happy_var_5) (Fix happy_var_7)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 11 happyReduction_19
happyReduction_19 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AWhile (Fix happy_var_3) (Fix happy_var_5)
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 5 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (APrint (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 7 11 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AIndexedAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3) (Fix happy_var_6)
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  12 happyReduction_24
happyReduction_24  =  HappyAbsSyn12
		 ([]
	)

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandLogicalAnd (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandPlus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandMinus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandMult (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandLess (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 (HappyTerminal (TIntLiteral  happy_var_1))
	 =  HappyAbsSyn13
		 (AExprInt happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn13
		 (AExprTrue
	)

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn13
		 (AExprFalse
	)

happyReduce_33 = happySpecReduce_2  13 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (AExprNegation (Fix happy_var_2)
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  14 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn14
		 (AExprIdentifier happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn14
		 (AExprThis
	)

happyReduce_38 = happyReduce 5 14 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprIntArray (Fix happy_var_4)
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 14 happyReduction_39
happyReduction_39 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprNewObject happy_var_2
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 4 14 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprList (Fix happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_3  14 happyReduction_41
happyReduction_41 _
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprLength (Fix happy_var_1)
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happyReduce 6 14 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprInvocation (Fix happy_var_1) happy_var_3 (fixMap happy_var_5)
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 6 14 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprInvocation (Fix happy_var_1) ("main") (fixMap happy_var_5)
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_2  15 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  15 happyReduction_45
happyReduction_45  =  HappyAbsSyn15
		 ([]
	)

happyReduce_46 = happySpecReduce_3  16 happyReduction_46
happyReduction_46 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_0  16 happyReduction_47
happyReduction_47  =  HappyAbsSyn16
		 ([]
	)

happyNewToken action sts stk [] =
	action 53 53 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TClass -> cont 17;
	TPublic -> cont 18;
	TStatic -> cont 19;
	TMain -> cont 20;
	TNew -> cont 21;
	TReturn -> cont 22;
	TIf -> cont 23;
	TElse -> cont 24;
	TWhile -> cont 25;
	TPrint -> cont 26;
	TLength -> cont 27;
	TThis -> cont 28;
	TVoid -> cont 29;
	TString -> cont 30;
	TInt -> cont 31;
	TBoolean -> cont 32;
	TTrue -> cont 33;
	TFalse -> cont 34;
	TNegation -> cont 35;
	TLogicAnd -> cont 36;
	TCompareLess -> cont 37;
	TAdd -> cont 38;
	TSub -> cont 39;
	TMul -> cont 40;
	TAssignment -> cont 41;
	TComma -> cont 42;
	TDot -> cont 43;
	TSemiColon -> cont 44;
	TLeftParen -> cont 45;
	TRightParen -> cont 46;
	TLeftBracket -> cont 47;
	TRightBracket -> cont 48;
	TLeftBrace -> cont 49;
	TRightBrace -> cont 50;
	TIdLiteral happy_dollar_dollar -> cont 51;
	TIntLiteral  happy_dollar_dollar -> cont 52;
	_ -> happyError' (tk:tks)
	}

happyError_ 53 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parserError

parseMiniJava tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


mainMethod arg vars code = AMethod TypeVoid "main" [Fix $ AVar TypeString arg] (fixMap vars) (fixMap code) (Fix AExprVoid)

fixMap = map Fix

parserError :: [Token] -> a
parserError (t1:t2:t3:t4:t5:_) = error $ "Parse error, next tokens:" ++ renderTokens [t1, t2, t3, t4, t5]

parserError tokens = error $ "Parse error @eof:" ++ renderTokens tokens

renderTokens = concatMap ((" " ++) . show)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
