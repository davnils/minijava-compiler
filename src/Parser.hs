{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Lexer

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

action_0 (19) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail

action_1 (19) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (19) = happyShift action_9
action_2 (6) = happyGoto action_8
action_2 _ = happyReduce_4

action_3 (22) = happyShift action_6
action_3 (59) = happyShift action_7
action_3 (18) = happyGoto action_5
action_3 _ = happyFail

action_4 (61) = happyAccept
action_4 _ = happyFail

action_5 (57) = happyShift action_11
action_5 _ = happyFail

action_6 _ = happyReduce_55

action_7 _ = happyReduce_54

action_8 _ = happyReduce_1

action_9 (22) = happyShift action_6
action_9 (59) = happyShift action_7
action_9 (18) = happyGoto action_10
action_9 _ = happyFail

action_10 (57) = happyShift action_13
action_10 _ = happyFail

action_11 (20) = happyShift action_12
action_11 _ = happyFail

action_12 (21) = happyShift action_15
action_12 _ = happyFail

action_13 (7) = happyGoto action_14
action_13 _ = happyReduce_5

action_14 (20) = happyShift action_20
action_14 (22) = happyShift action_6
action_14 (33) = happyShift action_21
action_14 (34) = happyShift action_22
action_14 (59) = happyShift action_7
action_14 (8) = happyGoto action_17
action_14 (11) = happyGoto action_18
action_14 (18) = happyGoto action_19
action_14 _ = happyReduce_8

action_15 (31) = happyShift action_16
action_15 _ = happyFail

action_16 (22) = happyShift action_27
action_16 _ = happyFail

action_17 (58) = happyShift action_26
action_17 _ = happyFail

action_18 (22) = happyShift action_6
action_18 (59) = happyShift action_7
action_18 (18) = happyGoto action_25
action_18 _ = happyFail

action_19 _ = happyReduce_16

action_20 (22) = happyShift action_6
action_20 (33) = happyShift action_21
action_20 (34) = happyShift action_22
action_20 (59) = happyShift action_7
action_20 (11) = happyGoto action_24
action_20 (18) = happyGoto action_19
action_20 _ = happyFail

action_21 (55) = happyShift action_23
action_21 _ = happyReduce_15

action_22 _ = happyReduce_14

action_23 (56) = happyShift action_32
action_23 _ = happyFail

action_24 (22) = happyShift action_6
action_24 (59) = happyShift action_7
action_24 (18) = happyGoto action_31
action_24 _ = happyFail

action_25 (52) = happyShift action_30
action_25 _ = happyFail

action_26 (19) = happyShift action_9
action_26 (6) = happyGoto action_29
action_26 _ = happyReduce_4

action_27 (53) = happyShift action_28
action_27 _ = happyFail

action_28 (32) = happyShift action_34
action_28 _ = happyFail

action_29 _ = happyReduce_3

action_30 _ = happyReduce_6

action_31 (53) = happyShift action_33
action_31 _ = happyFail

action_32 _ = happyReduce_13

action_33 (22) = happyShift action_6
action_33 (33) = happyShift action_21
action_33 (34) = happyShift action_22
action_33 (59) = happyShift action_7
action_33 (9) = happyGoto action_36
action_33 (11) = happyGoto action_37
action_33 (18) = happyGoto action_19
action_33 _ = happyReduce_10

action_34 (55) = happyShift action_35
action_34 _ = happyFail

action_35 (56) = happyShift action_40
action_35 _ = happyFail

action_36 (54) = happyShift action_39
action_36 _ = happyFail

action_37 (22) = happyShift action_6
action_37 (59) = happyShift action_7
action_37 (18) = happyGoto action_38
action_37 _ = happyFail

action_38 (50) = happyShift action_44
action_38 (10) = happyGoto action_43
action_38 _ = happyReduce_12

action_39 (57) = happyShift action_42
action_39 _ = happyFail

action_40 (22) = happyShift action_6
action_40 (59) = happyShift action_7
action_40 (18) = happyGoto action_41
action_40 _ = happyFail

action_41 (54) = happyShift action_47
action_41 _ = happyFail

action_42 (7) = happyGoto action_46
action_42 _ = happyReduce_5

action_43 _ = happyReduce_9

action_44 (22) = happyShift action_6
action_44 (33) = happyShift action_21
action_44 (34) = happyShift action_22
action_44 (59) = happyShift action_7
action_44 (11) = happyGoto action_45
action_44 (18) = happyGoto action_19
action_44 _ = happyFail

action_45 (22) = happyShift action_6
action_45 (59) = happyShift action_7
action_45 (18) = happyGoto action_56
action_45 _ = happyFail

action_46 (22) = happyShift action_6
action_46 (25) = happyShift action_52
action_46 (27) = happyShift action_53
action_46 (28) = happyShift action_54
action_46 (33) = happyShift action_21
action_46 (34) = happyShift action_22
action_46 (57) = happyShift action_55
action_46 (59) = happyShift action_7
action_46 (11) = happyGoto action_18
action_46 (12) = happyGoto action_49
action_46 (13) = happyGoto action_50
action_46 (18) = happyGoto action_51
action_46 _ = happyReduce_25

action_47 (57) = happyShift action_48
action_47 _ = happyFail

action_48 (7) = happyGoto action_67
action_48 _ = happyReduce_5

action_49 (22) = happyShift action_6
action_49 (25) = happyShift action_52
action_49 (27) = happyShift action_53
action_49 (28) = happyShift action_54
action_49 (57) = happyShift action_55
action_49 (59) = happyShift action_7
action_49 (12) = happyGoto action_49
action_49 (13) = happyGoto action_66
action_49 (18) = happyGoto action_59
action_49 _ = happyReduce_25

action_50 (24) = happyShift action_65
action_50 _ = happyFail

action_51 (49) = happyShift action_63
action_51 (55) = happyShift action_64
action_51 _ = happyReduce_16

action_52 (53) = happyShift action_62
action_52 _ = happyFail

action_53 (53) = happyShift action_61
action_53 _ = happyFail

action_54 (53) = happyShift action_60
action_54 _ = happyFail

action_55 (22) = happyShift action_6
action_55 (25) = happyShift action_52
action_55 (27) = happyShift action_53
action_55 (28) = happyShift action_54
action_55 (57) = happyShift action_55
action_55 (59) = happyShift action_7
action_55 (12) = happyGoto action_49
action_55 (13) = happyGoto action_58
action_55 (18) = happyGoto action_59
action_55 _ = happyReduce_25

action_56 (50) = happyShift action_44
action_56 (10) = happyGoto action_57
action_56 _ = happyReduce_12

action_57 _ = happyReduce_11

action_58 (58) = happyShift action_84
action_58 _ = happyFail

action_59 (49) = happyShift action_63
action_59 (55) = happyShift action_64
action_59 _ = happyFail

action_60 (22) = happyShift action_6
action_60 (23) = happyShift action_72
action_60 (30) = happyShift action_73
action_60 (35) = happyShift action_74
action_60 (36) = happyShift action_75
action_60 (37) = happyShift action_76
action_60 (53) = happyShift action_77
action_60 (59) = happyShift action_7
action_60 (60) = happyShift action_78
action_60 (14) = happyGoto action_83
action_60 (15) = happyGoto action_70
action_60 (18) = happyGoto action_71
action_60 _ = happyFail

action_61 (22) = happyShift action_6
action_61 (23) = happyShift action_72
action_61 (30) = happyShift action_73
action_61 (35) = happyShift action_74
action_61 (36) = happyShift action_75
action_61 (37) = happyShift action_76
action_61 (53) = happyShift action_77
action_61 (59) = happyShift action_7
action_61 (60) = happyShift action_78
action_61 (14) = happyGoto action_82
action_61 (15) = happyGoto action_70
action_61 (18) = happyGoto action_71
action_61 _ = happyFail

action_62 (22) = happyShift action_6
action_62 (23) = happyShift action_72
action_62 (30) = happyShift action_73
action_62 (35) = happyShift action_74
action_62 (36) = happyShift action_75
action_62 (37) = happyShift action_76
action_62 (53) = happyShift action_77
action_62 (59) = happyShift action_7
action_62 (60) = happyShift action_78
action_62 (14) = happyGoto action_81
action_62 (15) = happyGoto action_70
action_62 (18) = happyGoto action_71
action_62 _ = happyFail

action_63 (22) = happyShift action_6
action_63 (23) = happyShift action_72
action_63 (30) = happyShift action_73
action_63 (35) = happyShift action_74
action_63 (36) = happyShift action_75
action_63 (37) = happyShift action_76
action_63 (53) = happyShift action_77
action_63 (59) = happyShift action_7
action_63 (60) = happyShift action_78
action_63 (14) = happyGoto action_80
action_63 (15) = happyGoto action_70
action_63 (18) = happyGoto action_71
action_63 _ = happyFail

action_64 (22) = happyShift action_6
action_64 (23) = happyShift action_72
action_64 (30) = happyShift action_73
action_64 (35) = happyShift action_74
action_64 (36) = happyShift action_75
action_64 (37) = happyShift action_76
action_64 (53) = happyShift action_77
action_64 (59) = happyShift action_7
action_64 (60) = happyShift action_78
action_64 (14) = happyGoto action_79
action_64 (15) = happyGoto action_70
action_64 (18) = happyGoto action_71
action_64 _ = happyFail

action_65 (22) = happyShift action_6
action_65 (23) = happyShift action_72
action_65 (30) = happyShift action_73
action_65 (35) = happyShift action_74
action_65 (36) = happyShift action_75
action_65 (37) = happyShift action_76
action_65 (53) = happyShift action_77
action_65 (59) = happyShift action_7
action_65 (60) = happyShift action_78
action_65 (14) = happyGoto action_69
action_65 (15) = happyGoto action_70
action_65 (18) = happyGoto action_71
action_65 _ = happyFail

action_66 _ = happyReduce_24

action_67 (22) = happyShift action_6
action_67 (25) = happyShift action_52
action_67 (27) = happyShift action_53
action_67 (28) = happyShift action_54
action_67 (33) = happyShift action_21
action_67 (34) = happyShift action_22
action_67 (57) = happyShift action_55
action_67 (59) = happyShift action_7
action_67 (11) = happyGoto action_18
action_67 (12) = happyGoto action_49
action_67 (13) = happyGoto action_68
action_67 (18) = happyGoto action_51
action_67 _ = happyReduce_25

action_68 (58) = happyShift action_108
action_68 _ = happyFail

action_69 (38) = happyShift action_85
action_69 (39) = happyShift action_86
action_69 (40) = happyShift action_87
action_69 (41) = happyShift action_88
action_69 (42) = happyShift action_89
action_69 (43) = happyShift action_90
action_69 (44) = happyShift action_91
action_69 (45) = happyShift action_92
action_69 (46) = happyShift action_93
action_69 (47) = happyShift action_94
action_69 (48) = happyShift action_95
action_69 (52) = happyShift action_107
action_69 _ = happyFail

action_70 (51) = happyShift action_105
action_70 (55) = happyShift action_106
action_70 _ = happyReduce_41

action_71 _ = happyReduce_43

action_72 (22) = happyShift action_6
action_72 (33) = happyShift action_104
action_72 (59) = happyShift action_7
action_72 (18) = happyGoto action_103
action_72 _ = happyFail

action_73 _ = happyReduce_44

action_74 _ = happyReduce_38

action_75 _ = happyReduce_39

action_76 (22) = happyShift action_6
action_76 (23) = happyShift action_72
action_76 (30) = happyShift action_73
action_76 (35) = happyShift action_74
action_76 (36) = happyShift action_75
action_76 (37) = happyShift action_76
action_76 (53) = happyShift action_77
action_76 (59) = happyShift action_7
action_76 (60) = happyShift action_78
action_76 (14) = happyGoto action_102
action_76 (15) = happyGoto action_70
action_76 (18) = happyGoto action_71
action_76 _ = happyFail

action_77 (22) = happyShift action_6
action_77 (23) = happyShift action_72
action_77 (30) = happyShift action_73
action_77 (35) = happyShift action_74
action_77 (36) = happyShift action_75
action_77 (37) = happyShift action_76
action_77 (53) = happyShift action_77
action_77 (59) = happyShift action_7
action_77 (60) = happyShift action_78
action_77 (14) = happyGoto action_101
action_77 (15) = happyGoto action_70
action_77 (18) = happyGoto action_71
action_77 _ = happyFail

action_78 _ = happyReduce_37

action_79 (38) = happyShift action_85
action_79 (39) = happyShift action_86
action_79 (40) = happyShift action_87
action_79 (41) = happyShift action_88
action_79 (42) = happyShift action_89
action_79 (43) = happyShift action_90
action_79 (44) = happyShift action_91
action_79 (45) = happyShift action_92
action_79 (46) = happyShift action_93
action_79 (47) = happyShift action_94
action_79 (48) = happyShift action_95
action_79 (56) = happyShift action_100
action_79 _ = happyFail

action_80 (38) = happyShift action_85
action_80 (39) = happyShift action_86
action_80 (40) = happyShift action_87
action_80 (41) = happyShift action_88
action_80 (42) = happyShift action_89
action_80 (43) = happyShift action_90
action_80 (44) = happyShift action_91
action_80 (45) = happyShift action_92
action_80 (46) = happyShift action_93
action_80 (47) = happyShift action_94
action_80 (48) = happyShift action_95
action_80 (52) = happyShift action_99
action_80 _ = happyFail

action_81 (38) = happyShift action_85
action_81 (39) = happyShift action_86
action_81 (40) = happyShift action_87
action_81 (41) = happyShift action_88
action_81 (42) = happyShift action_89
action_81 (43) = happyShift action_90
action_81 (44) = happyShift action_91
action_81 (45) = happyShift action_92
action_81 (46) = happyShift action_93
action_81 (47) = happyShift action_94
action_81 (48) = happyShift action_95
action_81 (54) = happyShift action_98
action_81 _ = happyFail

action_82 (38) = happyShift action_85
action_82 (39) = happyShift action_86
action_82 (40) = happyShift action_87
action_82 (41) = happyShift action_88
action_82 (42) = happyShift action_89
action_82 (43) = happyShift action_90
action_82 (44) = happyShift action_91
action_82 (45) = happyShift action_92
action_82 (46) = happyShift action_93
action_82 (47) = happyShift action_94
action_82 (48) = happyShift action_95
action_82 (54) = happyShift action_97
action_82 _ = happyFail

action_83 (38) = happyShift action_85
action_83 (39) = happyShift action_86
action_83 (40) = happyShift action_87
action_83 (41) = happyShift action_88
action_83 (42) = happyShift action_89
action_83 (43) = happyShift action_90
action_83 (44) = happyShift action_91
action_83 (45) = happyShift action_92
action_83 (46) = happyShift action_93
action_83 (47) = happyShift action_94
action_83 (48) = happyShift action_95
action_83 (54) = happyShift action_96
action_83 _ = happyFail

action_84 _ = happyReduce_17

action_85 (22) = happyShift action_6
action_85 (23) = happyShift action_72
action_85 (30) = happyShift action_73
action_85 (35) = happyShift action_74
action_85 (36) = happyShift action_75
action_85 (37) = happyShift action_76
action_85 (53) = happyShift action_77
action_85 (59) = happyShift action_7
action_85 (60) = happyShift action_78
action_85 (14) = happyGoto action_131
action_85 (15) = happyGoto action_70
action_85 (18) = happyGoto action_71
action_85 _ = happyFail

action_86 (22) = happyShift action_6
action_86 (23) = happyShift action_72
action_86 (30) = happyShift action_73
action_86 (35) = happyShift action_74
action_86 (36) = happyShift action_75
action_86 (37) = happyShift action_76
action_86 (53) = happyShift action_77
action_86 (59) = happyShift action_7
action_86 (60) = happyShift action_78
action_86 (14) = happyGoto action_130
action_86 (15) = happyGoto action_70
action_86 (18) = happyGoto action_71
action_86 _ = happyFail

action_87 (22) = happyShift action_6
action_87 (23) = happyShift action_72
action_87 (30) = happyShift action_73
action_87 (35) = happyShift action_74
action_87 (36) = happyShift action_75
action_87 (37) = happyShift action_76
action_87 (53) = happyShift action_77
action_87 (59) = happyShift action_7
action_87 (60) = happyShift action_78
action_87 (14) = happyGoto action_129
action_87 (15) = happyGoto action_70
action_87 (18) = happyGoto action_71
action_87 _ = happyFail

action_88 (22) = happyShift action_6
action_88 (23) = happyShift action_72
action_88 (30) = happyShift action_73
action_88 (35) = happyShift action_74
action_88 (36) = happyShift action_75
action_88 (37) = happyShift action_76
action_88 (53) = happyShift action_77
action_88 (59) = happyShift action_7
action_88 (60) = happyShift action_78
action_88 (14) = happyGoto action_128
action_88 (15) = happyGoto action_70
action_88 (18) = happyGoto action_71
action_88 _ = happyFail

action_89 (22) = happyShift action_6
action_89 (23) = happyShift action_72
action_89 (30) = happyShift action_73
action_89 (35) = happyShift action_74
action_89 (36) = happyShift action_75
action_89 (37) = happyShift action_76
action_89 (53) = happyShift action_77
action_89 (59) = happyShift action_7
action_89 (60) = happyShift action_78
action_89 (14) = happyGoto action_127
action_89 (15) = happyGoto action_70
action_89 (18) = happyGoto action_71
action_89 _ = happyFail

action_90 (22) = happyShift action_6
action_90 (23) = happyShift action_72
action_90 (30) = happyShift action_73
action_90 (35) = happyShift action_74
action_90 (36) = happyShift action_75
action_90 (37) = happyShift action_76
action_90 (53) = happyShift action_77
action_90 (59) = happyShift action_7
action_90 (60) = happyShift action_78
action_90 (14) = happyGoto action_126
action_90 (15) = happyGoto action_70
action_90 (18) = happyGoto action_71
action_90 _ = happyFail

action_91 (22) = happyShift action_6
action_91 (23) = happyShift action_72
action_91 (30) = happyShift action_73
action_91 (35) = happyShift action_74
action_91 (36) = happyShift action_75
action_91 (37) = happyShift action_76
action_91 (53) = happyShift action_77
action_91 (59) = happyShift action_7
action_91 (60) = happyShift action_78
action_91 (14) = happyGoto action_125
action_91 (15) = happyGoto action_70
action_91 (18) = happyGoto action_71
action_91 _ = happyFail

action_92 (22) = happyShift action_6
action_92 (23) = happyShift action_72
action_92 (30) = happyShift action_73
action_92 (35) = happyShift action_74
action_92 (36) = happyShift action_75
action_92 (37) = happyShift action_76
action_92 (53) = happyShift action_77
action_92 (59) = happyShift action_7
action_92 (60) = happyShift action_78
action_92 (14) = happyGoto action_124
action_92 (15) = happyGoto action_70
action_92 (18) = happyGoto action_71
action_92 _ = happyFail

action_93 (22) = happyShift action_6
action_93 (23) = happyShift action_72
action_93 (30) = happyShift action_73
action_93 (35) = happyShift action_74
action_93 (36) = happyShift action_75
action_93 (37) = happyShift action_76
action_93 (53) = happyShift action_77
action_93 (59) = happyShift action_7
action_93 (60) = happyShift action_78
action_93 (14) = happyGoto action_123
action_93 (15) = happyGoto action_70
action_93 (18) = happyGoto action_71
action_93 _ = happyFail

action_94 (22) = happyShift action_6
action_94 (23) = happyShift action_72
action_94 (30) = happyShift action_73
action_94 (35) = happyShift action_74
action_94 (36) = happyShift action_75
action_94 (37) = happyShift action_76
action_94 (53) = happyShift action_77
action_94 (59) = happyShift action_7
action_94 (60) = happyShift action_78
action_94 (14) = happyGoto action_122
action_94 (15) = happyGoto action_70
action_94 (18) = happyGoto action_71
action_94 _ = happyFail

action_95 (22) = happyShift action_6
action_95 (23) = happyShift action_72
action_95 (30) = happyShift action_73
action_95 (35) = happyShift action_74
action_95 (36) = happyShift action_75
action_95 (37) = happyShift action_76
action_95 (53) = happyShift action_77
action_95 (59) = happyShift action_7
action_95 (60) = happyShift action_78
action_95 (14) = happyGoto action_121
action_95 (15) = happyGoto action_70
action_95 (18) = happyGoto action_71
action_95 _ = happyFail

action_96 (52) = happyShift action_120
action_96 _ = happyFail

action_97 (22) = happyShift action_6
action_97 (25) = happyShift action_52
action_97 (27) = happyShift action_53
action_97 (28) = happyShift action_54
action_97 (57) = happyShift action_55
action_97 (59) = happyShift action_7
action_97 (12) = happyGoto action_119
action_97 (18) = happyGoto action_59
action_97 _ = happyFail

action_98 (22) = happyShift action_6
action_98 (25) = happyShift action_52
action_98 (27) = happyShift action_53
action_98 (28) = happyShift action_54
action_98 (57) = happyShift action_55
action_98 (59) = happyShift action_7
action_98 (12) = happyGoto action_118
action_98 (18) = happyGoto action_59
action_98 _ = happyFail

action_99 _ = happyReduce_22

action_100 (49) = happyShift action_117
action_100 _ = happyFail

action_101 (38) = happyShift action_85
action_101 (39) = happyShift action_86
action_101 (40) = happyShift action_87
action_101 (41) = happyShift action_88
action_101 (42) = happyShift action_89
action_101 (43) = happyShift action_90
action_101 (44) = happyShift action_91
action_101 (45) = happyShift action_92
action_101 (46) = happyShift action_93
action_101 (47) = happyShift action_94
action_101 (48) = happyShift action_95
action_101 (54) = happyShift action_116
action_101 _ = happyFail

action_102 _ = happyReduce_40

action_103 (53) = happyShift action_115
action_103 _ = happyFail

action_104 (55) = happyShift action_114
action_104 _ = happyFail

action_105 (22) = happyShift action_6
action_105 (29) = happyShift action_113
action_105 (59) = happyShift action_7
action_105 (18) = happyGoto action_112
action_105 _ = happyFail

action_106 (22) = happyShift action_6
action_106 (23) = happyShift action_72
action_106 (30) = happyShift action_73
action_106 (35) = happyShift action_74
action_106 (36) = happyShift action_75
action_106 (37) = happyShift action_76
action_106 (53) = happyShift action_77
action_106 (59) = happyShift action_7
action_106 (60) = happyShift action_78
action_106 (14) = happyGoto action_111
action_106 (15) = happyGoto action_70
action_106 (18) = happyGoto action_71
action_106 _ = happyFail

action_107 (58) = happyShift action_110
action_107 _ = happyFail

action_108 (58) = happyShift action_109
action_108 _ = happyFail

action_109 _ = happyReduce_2

action_110 (20) = happyShift action_20
action_110 (8) = happyGoto action_138
action_110 _ = happyReduce_8

action_111 (38) = happyShift action_85
action_111 (39) = happyShift action_86
action_111 (40) = happyShift action_87
action_111 (41) = happyShift action_88
action_111 (42) = happyShift action_89
action_111 (43) = happyShift action_90
action_111 (44) = happyShift action_91
action_111 (45) = happyShift action_92
action_111 (46) = happyShift action_93
action_111 (47) = happyShift action_94
action_111 (48) = happyShift action_95
action_111 (56) = happyShift action_137
action_111 _ = happyFail

action_112 (53) = happyShift action_136
action_112 _ = happyFail

action_113 _ = happyReduce_48

action_114 (22) = happyShift action_6
action_114 (23) = happyShift action_72
action_114 (30) = happyShift action_73
action_114 (35) = happyShift action_74
action_114 (36) = happyShift action_75
action_114 (37) = happyShift action_76
action_114 (53) = happyShift action_77
action_114 (59) = happyShift action_7
action_114 (60) = happyShift action_78
action_114 (14) = happyGoto action_135
action_114 (15) = happyGoto action_70
action_114 (18) = happyGoto action_71
action_114 _ = happyFail

action_115 (54) = happyShift action_134
action_115 _ = happyFail

action_116 _ = happyReduce_42

action_117 (22) = happyShift action_6
action_117 (23) = happyShift action_72
action_117 (30) = happyShift action_73
action_117 (35) = happyShift action_74
action_117 (36) = happyShift action_75
action_117 (37) = happyShift action_76
action_117 (53) = happyShift action_77
action_117 (59) = happyShift action_7
action_117 (60) = happyShift action_78
action_117 (14) = happyGoto action_133
action_117 (15) = happyGoto action_70
action_117 (18) = happyGoto action_71
action_117 _ = happyFail

action_118 (26) = happyShift action_132
action_118 _ = happyReduce_19

action_119 _ = happyReduce_20

action_120 _ = happyReduce_21

action_121 _ = happyReduce_30

action_122 (48) = happyShift action_95
action_122 _ = happyReduce_29

action_123 (48) = happyShift action_95
action_123 _ = happyReduce_28

action_124 (46) = happyShift action_93
action_124 (47) = happyShift action_94
action_124 (48) = happyShift action_95
action_124 _ = happyReduce_34

action_125 (45) = happyShift action_92
action_125 (46) = happyShift action_93
action_125 (47) = happyShift action_94
action_125 (48) = happyShift action_95
action_125 _ = happyReduce_33

action_126 (43) = happyFail
action_126 (44) = happyShift action_91
action_126 (45) = happyShift action_92
action_126 (46) = happyShift action_93
action_126 (47) = happyShift action_94
action_126 (48) = happyShift action_95
action_126 _ = happyReduce_36

action_127 (42) = happyFail
action_127 (43) = happyShift action_90
action_127 (44) = happyShift action_91
action_127 (45) = happyShift action_92
action_127 (46) = happyShift action_93
action_127 (47) = happyShift action_94
action_127 (48) = happyShift action_95
action_127 _ = happyReduce_35

action_128 (41) = happyFail
action_128 (42) = happyShift action_89
action_128 (43) = happyShift action_90
action_128 (44) = happyShift action_91
action_128 (45) = happyShift action_92
action_128 (46) = happyShift action_93
action_128 (47) = happyShift action_94
action_128 (48) = happyShift action_95
action_128 _ = happyReduce_32

action_129 (40) = happyFail
action_129 (41) = happyShift action_88
action_129 (42) = happyShift action_89
action_129 (43) = happyShift action_90
action_129 (44) = happyShift action_91
action_129 (45) = happyShift action_92
action_129 (46) = happyShift action_93
action_129 (47) = happyShift action_94
action_129 (48) = happyShift action_95
action_129 _ = happyReduce_31

action_130 (38) = happyShift action_85
action_130 (40) = happyShift action_87
action_130 (41) = happyShift action_88
action_130 (42) = happyShift action_89
action_130 (43) = happyShift action_90
action_130 (44) = happyShift action_91
action_130 (45) = happyShift action_92
action_130 (46) = happyShift action_93
action_130 (47) = happyShift action_94
action_130 (48) = happyShift action_95
action_130 _ = happyReduce_27

action_131 (40) = happyShift action_87
action_131 (41) = happyShift action_88
action_131 (42) = happyShift action_89
action_131 (43) = happyShift action_90
action_131 (44) = happyShift action_91
action_131 (45) = happyShift action_92
action_131 (46) = happyShift action_93
action_131 (47) = happyShift action_94
action_131 (48) = happyShift action_95
action_131 _ = happyReduce_26

action_132 (22) = happyShift action_6
action_132 (25) = happyShift action_52
action_132 (27) = happyShift action_53
action_132 (28) = happyShift action_54
action_132 (57) = happyShift action_55
action_132 (59) = happyShift action_7
action_132 (12) = happyGoto action_143
action_132 (18) = happyGoto action_59
action_132 _ = happyFail

action_133 (38) = happyShift action_85
action_133 (39) = happyShift action_86
action_133 (40) = happyShift action_87
action_133 (41) = happyShift action_88
action_133 (42) = happyShift action_89
action_133 (43) = happyShift action_90
action_133 (44) = happyShift action_91
action_133 (45) = happyShift action_92
action_133 (46) = happyShift action_93
action_133 (47) = happyShift action_94
action_133 (48) = happyShift action_95
action_133 (52) = happyShift action_142
action_133 _ = happyFail

action_134 _ = happyReduce_46

action_135 (38) = happyShift action_85
action_135 (39) = happyShift action_86
action_135 (40) = happyShift action_87
action_135 (41) = happyShift action_88
action_135 (42) = happyShift action_89
action_135 (43) = happyShift action_90
action_135 (44) = happyShift action_91
action_135 (45) = happyShift action_92
action_135 (46) = happyShift action_93
action_135 (47) = happyShift action_94
action_135 (48) = happyShift action_95
action_135 (56) = happyShift action_141
action_135 _ = happyFail

action_136 (22) = happyShift action_6
action_136 (23) = happyShift action_72
action_136 (30) = happyShift action_73
action_136 (35) = happyShift action_74
action_136 (36) = happyShift action_75
action_136 (37) = happyShift action_76
action_136 (53) = happyShift action_77
action_136 (59) = happyShift action_7
action_136 (60) = happyShift action_78
action_136 (14) = happyGoto action_139
action_136 (15) = happyGoto action_70
action_136 (16) = happyGoto action_140
action_136 (18) = happyGoto action_71
action_136 _ = happyReduce_51

action_137 _ = happyReduce_47

action_138 _ = happyReduce_7

action_139 (38) = happyShift action_85
action_139 (39) = happyShift action_86
action_139 (40) = happyShift action_87
action_139 (41) = happyShift action_88
action_139 (42) = happyShift action_89
action_139 (43) = happyShift action_90
action_139 (44) = happyShift action_91
action_139 (45) = happyShift action_92
action_139 (46) = happyShift action_93
action_139 (47) = happyShift action_94
action_139 (48) = happyShift action_95
action_139 (50) = happyShift action_146
action_139 (17) = happyGoto action_145
action_139 _ = happyReduce_53

action_140 (54) = happyShift action_144
action_140 _ = happyFail

action_141 _ = happyReduce_45

action_142 _ = happyReduce_23

action_143 _ = happyReduce_18

action_144 _ = happyReduce_49

action_145 _ = happyReduce_50

action_146 (22) = happyShift action_6
action_146 (23) = happyShift action_72
action_146 (30) = happyShift action_73
action_146 (35) = happyShift action_74
action_146 (36) = happyShift action_75
action_146 (37) = happyShift action_76
action_146 (53) = happyShift action_77
action_146 (59) = happyShift action_7
action_146 (60) = happyShift action_78
action_146 (14) = happyGoto action_147
action_146 (15) = happyGoto action_70
action_146 (18) = happyGoto action_71
action_146 _ = happyFail

action_147 (38) = happyShift action_85
action_147 (39) = happyShift action_86
action_147 (40) = happyShift action_87
action_147 (41) = happyShift action_88
action_147 (42) = happyShift action_89
action_147 (43) = happyShift action_90
action_147 (44) = happyShift action_91
action_147 (45) = happyShift action_92
action_147 (46) = happyShift action_93
action_147 (47) = happyShift action_94
action_147 (48) = happyShift action_95
action_147 (50) = happyShift action_146
action_147 (17) = happyGoto action_148
action_147 _ = happyReduce_53

action_148 _ = happyReduce_52

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
	(HappyAbsSyn13  happy_var_16) `HappyStk`
	(HappyAbsSyn7  happy_var_15) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
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
	(HappyAbsSyn18  happy_var_2) `HappyStk`
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
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (happy_var_1 ++ [AVar happy_var_2 happy_var_3]
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 14 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_14) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_11) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_9) `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AMethod happy_var_2 happy_var_3 (fixMap happy_var_5) (fixMap happy_var_8) (fixMap happy_var_9) (Fix happy_var_11) : happy_var_14
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_0  8 happyReduction_8
happyReduction_8  =  HappyAbsSyn8
		 ([]
	)

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (AVar happy_var_1 happy_var_2 : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_0  9 happyReduction_10
happyReduction_10  =  HappyAbsSyn9
		 ([]
	)

happyReduce_11 = happyReduce 4 10 happyReduction_11
happyReduction_11 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (AVar happy_var_2 happy_var_3 : happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_0  10 happyReduction_12
happyReduction_12  =  HappyAbsSyn10
		 ([]
	)

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 _
	_
	_
	 =  HappyAbsSyn11
		 (TypeIntegerArray
	)

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn11
		 (TypeBoolean
	)

happyReduce_15 = happySpecReduce_1  11 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn11
		 (TypeInteger
	)

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn11
		 (TypeAppDefined happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (AStatScope (fixMap happy_var_2)
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 7 12 happyReduction_18
happyReduction_18 ((HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (AIf (Fix happy_var_3) (Fix happy_var_5) (Fix happy_var_7)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 12 happyReduction_19
happyReduction_19 ((HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (AIf (Fix happy_var_3) (Fix happy_var_5) (Fix $ AStatScope [])
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 5 12 happyReduction_20
happyReduction_20 ((HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (AWhile (Fix happy_var_3) (Fix happy_var_5)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (APrint (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 12 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (AAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 7 12 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (AIndexedAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3) (Fix happy_var_6)
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_2  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  13 happyReduction_25
happyReduction_25  =  HappyAbsSyn13
		 ([]
	)

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLogicalAnd (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLogicalOr (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandPlus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandMinus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandMult (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLess (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  14 happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLess (Fix happy_var_3) (Fix happy_var_1)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  14 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandEqual (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprNegation (Fix $ AExprOp OperandEqual (Fix happy_var_1) (Fix happy_var_3))
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  14 happyReduction_35
happyReduction_35 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLessEqual (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprOp OperandLessEqual (Fix happy_var_3) (Fix happy_var_1)
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 (HappyTerminal (TIntLiteral  happy_var_1))
	 =  HappyAbsSyn14
		 (AExprInt happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  14 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn14
		 (AExprTrue
	)

happyReduce_39 = happySpecReduce_1  14 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn14
		 (AExprFalse
	)

happyReduce_40 = happySpecReduce_2  14 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (AExprNegation (Fix happy_var_2)
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  15 happyReduction_42
happyReduction_42 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn15
		 (AExprIdentifier happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn15
		 (AExprThis
	)

happyReduce_45 = happyReduce 5 15 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AExprIntArray (Fix happy_var_4)
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 4 15 happyReduction_46
happyReduction_46 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AExprNewObject happy_var_2
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 4 15 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AExprList (Fix happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_3  15 happyReduction_48
happyReduction_48 _
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AExprLength (Fix happy_var_1)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happyReduce 6 15 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AExprInvocation (Fix happy_var_1) happy_var_3 (fixMap happy_var_5)
	) `HappyStk` happyRest

happyReduce_50 = happySpecReduce_2  16 happyReduction_50
happyReduction_50 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_0  16 happyReduction_51
happyReduction_51  =  HappyAbsSyn16
		 ([]
	)

happyReduce_52 = happySpecReduce_3  17 happyReduction_52
happyReduction_52 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (happy_var_2 : happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_0  17 happyReduction_53
happyReduction_53  =  HappyAbsSyn17
		 ([]
	)

happyReduce_54 = happySpecReduce_1  18 happyReduction_54
happyReduction_54 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  18 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn18
		 ("main"
	)

happyNewToken action sts stk [] =
	action 61 61 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TClass -> cont 19;
	TPublic -> cont 20;
	TStatic -> cont 21;
	TMain -> cont 22;
	TNew -> cont 23;
	TReturn -> cont 24;
	TIf -> cont 25;
	TElse -> cont 26;
	TWhile -> cont 27;
	TPrint -> cont 28;
	TLength -> cont 29;
	TThis -> cont 30;
	TVoid -> cont 31;
	TString -> cont 32;
	TInt -> cont 33;
	TBoolean -> cont 34;
	TTrue -> cont 35;
	TFalse -> cont 36;
	TNegation -> cont 37;
	TLogicAnd -> cont 38;
	TLogicOr -> cont 39;
	TCompareLess -> cont 40;
	TCompareGreater -> cont 41;
	TCompareLessEqual -> cont 42;
	TCompareGreaterEqual -> cont 43;
	TCompareEqual -> cont 44;
	TCompareNotEqual -> cont 45;
	TAdd -> cont 46;
	TSub -> cont 47;
	TMul -> cont 48;
	TAssignment -> cont 49;
	TComma -> cont 50;
	TDot -> cont 51;
	TSemiColon -> cont 52;
	TLeftParen -> cont 53;
	TRightParen -> cont 54;
	TLeftBracket -> cont 55;
	TRightBracket -> cont 56;
	TLeftBrace -> cont 57;
	TRightBrace -> cont 58;
	TIdLiteral happy_dollar_dollar -> cont 59;
	TIntLiteral  happy_dollar_dollar -> cont 60;
	_ -> happyError' (tk:tks)
	}

happyError_ 61 tk tks = happyError' tks
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


mainMethod arg vars code = AMethod TypeVoid "main" [Fix $ AVar TypeVoid arg] (fixMap vars) (fixMap code) (Fix AExprVoid)

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
