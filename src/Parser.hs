{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Lexer

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
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

action_0 (18) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail

action_1 (18) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (18) = happyShift action_11
action_2 (6) = happyGoto action_10
action_2 _ = happyReduce_4

action_3 (21) = happyShift action_6
action_3 (28) = happyShift action_7
action_3 (31) = happyShift action_8
action_3 (52) = happyShift action_9
action_3 (17) = happyGoto action_5
action_3 _ = happyFail

action_4 (54) = happyAccept
action_4 _ = happyFail

action_5 (50) = happyShift action_13
action_5 _ = happyFail

action_6 _ = happyReduce_48

action_7 _ = happyReduce_47

action_8 _ = happyReduce_49

action_9 _ = happyReduce_46

action_10 _ = happyReduce_1

action_11 (21) = happyShift action_6
action_11 (28) = happyShift action_7
action_11 (31) = happyShift action_8
action_11 (52) = happyShift action_9
action_11 (17) = happyGoto action_12
action_11 _ = happyFail

action_12 (50) = happyShift action_15
action_12 _ = happyFail

action_13 (19) = happyShift action_14
action_13 _ = happyFail

action_14 (20) = happyShift action_17
action_14 _ = happyFail

action_15 (7) = happyGoto action_16
action_15 _ = happyReduce_5

action_16 (19) = happyShift action_22
action_16 (21) = happyShift action_6
action_16 (28) = happyShift action_7
action_16 (31) = happyShift action_8
action_16 (32) = happyShift action_23
action_16 (33) = happyShift action_24
action_16 (52) = happyShift action_9
action_16 (8) = happyGoto action_19
action_16 (10) = happyGoto action_20
action_16 (17) = happyGoto action_21
action_16 _ = happyReduce_8

action_17 (30) = happyShift action_18
action_17 _ = happyFail

action_18 (21) = happyShift action_29
action_18 _ = happyFail

action_19 (51) = happyShift action_28
action_19 _ = happyFail

action_20 (21) = happyShift action_6
action_20 (28) = happyShift action_7
action_20 (31) = happyShift action_8
action_20 (52) = happyShift action_9
action_20 (17) = happyGoto action_27
action_20 _ = happyFail

action_21 _ = happyReduce_15

action_22 (21) = happyShift action_6
action_22 (28) = happyShift action_7
action_22 (31) = happyShift action_8
action_22 (32) = happyShift action_23
action_22 (33) = happyShift action_24
action_22 (52) = happyShift action_9
action_22 (10) = happyGoto action_26
action_22 (17) = happyGoto action_21
action_22 _ = happyFail

action_23 (48) = happyShift action_25
action_23 _ = happyReduce_14

action_24 _ = happyReduce_13

action_25 (49) = happyShift action_34
action_25 _ = happyFail

action_26 (21) = happyShift action_6
action_26 (28) = happyShift action_7
action_26 (31) = happyShift action_8
action_26 (52) = happyShift action_9
action_26 (17) = happyGoto action_33
action_26 _ = happyFail

action_27 (45) = happyShift action_32
action_27 _ = happyFail

action_28 (18) = happyShift action_11
action_28 (6) = happyGoto action_31
action_28 _ = happyReduce_4

action_29 (46) = happyShift action_30
action_29 _ = happyFail

action_30 (31) = happyShift action_36
action_30 _ = happyFail

action_31 _ = happyReduce_3

action_32 _ = happyReduce_6

action_33 (46) = happyShift action_35
action_33 _ = happyFail

action_34 _ = happyReduce_12

action_35 (21) = happyShift action_6
action_35 (28) = happyShift action_7
action_35 (31) = happyShift action_8
action_35 (32) = happyShift action_23
action_35 (33) = happyShift action_24
action_35 (52) = happyShift action_9
action_35 (9) = happyGoto action_38
action_35 (10) = happyGoto action_39
action_35 (17) = happyGoto action_21
action_35 _ = happyReduce_11

action_36 (48) = happyShift action_37
action_36 _ = happyFail

action_37 (49) = happyShift action_42
action_37 _ = happyFail

action_38 (47) = happyShift action_41
action_38 _ = happyFail

action_39 (21) = happyShift action_6
action_39 (28) = happyShift action_7
action_39 (31) = happyShift action_8
action_39 (52) = happyShift action_9
action_39 (17) = happyGoto action_40
action_39 _ = happyFail

action_40 (43) = happyShift action_45
action_40 _ = happyReduce_10

action_41 (50) = happyShift action_44
action_41 _ = happyFail

action_42 (21) = happyShift action_6
action_42 (28) = happyShift action_7
action_42 (31) = happyShift action_8
action_42 (52) = happyShift action_9
action_42 (17) = happyGoto action_43
action_42 _ = happyFail

action_43 (47) = happyShift action_48
action_43 _ = happyFail

action_44 (7) = happyGoto action_47
action_44 _ = happyReduce_5

action_45 (21) = happyShift action_6
action_45 (28) = happyShift action_7
action_45 (31) = happyShift action_8
action_45 (32) = happyShift action_23
action_45 (33) = happyShift action_24
action_45 (52) = happyShift action_9
action_45 (9) = happyGoto action_46
action_45 (10) = happyGoto action_39
action_45 (17) = happyGoto action_21
action_45 _ = happyReduce_11

action_46 _ = happyReduce_9

action_47 (21) = happyShift action_6
action_47 (24) = happyShift action_53
action_47 (26) = happyShift action_54
action_47 (27) = happyShift action_55
action_47 (28) = happyShift action_7
action_47 (31) = happyShift action_8
action_47 (32) = happyShift action_23
action_47 (33) = happyShift action_24
action_47 (50) = happyShift action_56
action_47 (52) = happyShift action_9
action_47 (10) = happyGoto action_20
action_47 (11) = happyGoto action_50
action_47 (12) = happyGoto action_51
action_47 (17) = happyGoto action_52
action_47 _ = happyReduce_23

action_48 (50) = happyShift action_49
action_48 _ = happyFail

action_49 (7) = happyGoto action_66
action_49 _ = happyReduce_5

action_50 (21) = happyShift action_6
action_50 (24) = happyShift action_53
action_50 (26) = happyShift action_54
action_50 (27) = happyShift action_55
action_50 (28) = happyShift action_7
action_50 (31) = happyShift action_8
action_50 (50) = happyShift action_56
action_50 (52) = happyShift action_9
action_50 (11) = happyGoto action_50
action_50 (12) = happyGoto action_65
action_50 (17) = happyGoto action_58
action_50 _ = happyReduce_23

action_51 (23) = happyShift action_64
action_51 _ = happyFail

action_52 (42) = happyShift action_62
action_52 (48) = happyShift action_63
action_52 _ = happyReduce_15

action_53 (46) = happyShift action_61
action_53 _ = happyFail

action_54 (46) = happyShift action_60
action_54 _ = happyFail

action_55 (46) = happyShift action_59
action_55 _ = happyFail

action_56 (21) = happyShift action_6
action_56 (24) = happyShift action_53
action_56 (26) = happyShift action_54
action_56 (27) = happyShift action_55
action_56 (28) = happyShift action_7
action_56 (31) = happyShift action_8
action_56 (50) = happyShift action_56
action_56 (52) = happyShift action_9
action_56 (11) = happyGoto action_50
action_56 (12) = happyGoto action_57
action_56 (17) = happyGoto action_58
action_56 _ = happyReduce_23

action_57 (51) = happyShift action_83
action_57 _ = happyFail

action_58 (42) = happyShift action_62
action_58 (48) = happyShift action_63
action_58 _ = happyFail

action_59 (21) = happyShift action_6
action_59 (22) = happyShift action_71
action_59 (28) = happyShift action_7
action_59 (29) = happyShift action_72
action_59 (31) = happyShift action_8
action_59 (34) = happyShift action_73
action_59 (35) = happyShift action_74
action_59 (36) = happyShift action_75
action_59 (46) = happyShift action_76
action_59 (52) = happyShift action_9
action_59 (53) = happyShift action_77
action_59 (13) = happyGoto action_82
action_59 (14) = happyGoto action_69
action_59 (17) = happyGoto action_70
action_59 _ = happyFail

action_60 (21) = happyShift action_6
action_60 (22) = happyShift action_71
action_60 (28) = happyShift action_7
action_60 (29) = happyShift action_72
action_60 (31) = happyShift action_8
action_60 (34) = happyShift action_73
action_60 (35) = happyShift action_74
action_60 (36) = happyShift action_75
action_60 (46) = happyShift action_76
action_60 (52) = happyShift action_9
action_60 (53) = happyShift action_77
action_60 (13) = happyGoto action_81
action_60 (14) = happyGoto action_69
action_60 (17) = happyGoto action_70
action_60 _ = happyFail

action_61 (21) = happyShift action_6
action_61 (22) = happyShift action_71
action_61 (28) = happyShift action_7
action_61 (29) = happyShift action_72
action_61 (31) = happyShift action_8
action_61 (34) = happyShift action_73
action_61 (35) = happyShift action_74
action_61 (36) = happyShift action_75
action_61 (46) = happyShift action_76
action_61 (52) = happyShift action_9
action_61 (53) = happyShift action_77
action_61 (13) = happyGoto action_80
action_61 (14) = happyGoto action_69
action_61 (17) = happyGoto action_70
action_61 _ = happyFail

action_62 (21) = happyShift action_6
action_62 (22) = happyShift action_71
action_62 (28) = happyShift action_7
action_62 (29) = happyShift action_72
action_62 (31) = happyShift action_8
action_62 (34) = happyShift action_73
action_62 (35) = happyShift action_74
action_62 (36) = happyShift action_75
action_62 (46) = happyShift action_76
action_62 (52) = happyShift action_9
action_62 (53) = happyShift action_77
action_62 (13) = happyGoto action_79
action_62 (14) = happyGoto action_69
action_62 (17) = happyGoto action_70
action_62 _ = happyFail

action_63 (21) = happyShift action_6
action_63 (22) = happyShift action_71
action_63 (28) = happyShift action_7
action_63 (29) = happyShift action_72
action_63 (31) = happyShift action_8
action_63 (34) = happyShift action_73
action_63 (35) = happyShift action_74
action_63 (36) = happyShift action_75
action_63 (46) = happyShift action_76
action_63 (52) = happyShift action_9
action_63 (53) = happyShift action_77
action_63 (13) = happyGoto action_78
action_63 (14) = happyGoto action_69
action_63 (17) = happyGoto action_70
action_63 _ = happyFail

action_64 (21) = happyShift action_6
action_64 (22) = happyShift action_71
action_64 (28) = happyShift action_7
action_64 (29) = happyShift action_72
action_64 (31) = happyShift action_8
action_64 (34) = happyShift action_73
action_64 (35) = happyShift action_74
action_64 (36) = happyShift action_75
action_64 (46) = happyShift action_76
action_64 (52) = happyShift action_9
action_64 (53) = happyShift action_77
action_64 (13) = happyGoto action_68
action_64 (14) = happyGoto action_69
action_64 (17) = happyGoto action_70
action_64 _ = happyFail

action_65 _ = happyReduce_22

action_66 (21) = happyShift action_6
action_66 (24) = happyShift action_53
action_66 (26) = happyShift action_54
action_66 (27) = happyShift action_55
action_66 (28) = happyShift action_7
action_66 (31) = happyShift action_8
action_66 (32) = happyShift action_23
action_66 (33) = happyShift action_24
action_66 (50) = happyShift action_56
action_66 (52) = happyShift action_9
action_66 (10) = happyGoto action_20
action_66 (11) = happyGoto action_50
action_66 (12) = happyGoto action_67
action_66 (17) = happyGoto action_52
action_66 _ = happyReduce_23

action_67 (51) = happyShift action_101
action_67 _ = happyFail

action_68 (37) = happyShift action_84
action_68 (38) = happyShift action_85
action_68 (39) = happyShift action_86
action_68 (40) = happyShift action_87
action_68 (41) = happyShift action_88
action_68 (45) = happyShift action_100
action_68 _ = happyFail

action_69 (44) = happyShift action_98
action_69 (48) = happyShift action_99
action_69 _ = happyReduce_33

action_70 _ = happyReduce_35

action_71 (21) = happyShift action_6
action_71 (28) = happyShift action_7
action_71 (31) = happyShift action_8
action_71 (32) = happyShift action_97
action_71 (52) = happyShift action_9
action_71 (17) = happyGoto action_96
action_71 _ = happyFail

action_72 _ = happyReduce_36

action_73 _ = happyReduce_30

action_74 _ = happyReduce_31

action_75 (21) = happyShift action_6
action_75 (22) = happyShift action_71
action_75 (28) = happyShift action_7
action_75 (29) = happyShift action_72
action_75 (31) = happyShift action_8
action_75 (34) = happyShift action_73
action_75 (35) = happyShift action_74
action_75 (36) = happyShift action_75
action_75 (46) = happyShift action_76
action_75 (52) = happyShift action_9
action_75 (53) = happyShift action_77
action_75 (13) = happyGoto action_95
action_75 (14) = happyGoto action_69
action_75 (17) = happyGoto action_70
action_75 _ = happyFail

action_76 (21) = happyShift action_6
action_76 (22) = happyShift action_71
action_76 (28) = happyShift action_7
action_76 (29) = happyShift action_72
action_76 (31) = happyShift action_8
action_76 (34) = happyShift action_73
action_76 (35) = happyShift action_74
action_76 (36) = happyShift action_75
action_76 (46) = happyShift action_76
action_76 (52) = happyShift action_9
action_76 (53) = happyShift action_77
action_76 (13) = happyGoto action_94
action_76 (14) = happyGoto action_69
action_76 (17) = happyGoto action_70
action_76 _ = happyFail

action_77 _ = happyReduce_29

action_78 (37) = happyShift action_84
action_78 (38) = happyShift action_85
action_78 (39) = happyShift action_86
action_78 (40) = happyShift action_87
action_78 (41) = happyShift action_88
action_78 (49) = happyShift action_93
action_78 _ = happyFail

action_79 (37) = happyShift action_84
action_79 (38) = happyShift action_85
action_79 (39) = happyShift action_86
action_79 (40) = happyShift action_87
action_79 (41) = happyShift action_88
action_79 (45) = happyShift action_92
action_79 _ = happyFail

action_80 (37) = happyShift action_84
action_80 (38) = happyShift action_85
action_80 (39) = happyShift action_86
action_80 (40) = happyShift action_87
action_80 (41) = happyShift action_88
action_80 (47) = happyShift action_91
action_80 _ = happyFail

action_81 (37) = happyShift action_84
action_81 (38) = happyShift action_85
action_81 (39) = happyShift action_86
action_81 (40) = happyShift action_87
action_81 (41) = happyShift action_88
action_81 (47) = happyShift action_90
action_81 _ = happyFail

action_82 (37) = happyShift action_84
action_82 (38) = happyShift action_85
action_82 (39) = happyShift action_86
action_82 (40) = happyShift action_87
action_82 (41) = happyShift action_88
action_82 (47) = happyShift action_89
action_82 _ = happyFail

action_83 _ = happyReduce_16

action_84 (21) = happyShift action_6
action_84 (22) = happyShift action_71
action_84 (28) = happyShift action_7
action_84 (29) = happyShift action_72
action_84 (31) = happyShift action_8
action_84 (34) = happyShift action_73
action_84 (35) = happyShift action_74
action_84 (36) = happyShift action_75
action_84 (46) = happyShift action_76
action_84 (52) = happyShift action_9
action_84 (53) = happyShift action_77
action_84 (13) = happyGoto action_118
action_84 (14) = happyGoto action_69
action_84 (17) = happyGoto action_70
action_84 _ = happyFail

action_85 (21) = happyShift action_6
action_85 (22) = happyShift action_71
action_85 (28) = happyShift action_7
action_85 (29) = happyShift action_72
action_85 (31) = happyShift action_8
action_85 (34) = happyShift action_73
action_85 (35) = happyShift action_74
action_85 (36) = happyShift action_75
action_85 (46) = happyShift action_76
action_85 (52) = happyShift action_9
action_85 (53) = happyShift action_77
action_85 (13) = happyGoto action_117
action_85 (14) = happyGoto action_69
action_85 (17) = happyGoto action_70
action_85 _ = happyFail

action_86 (21) = happyShift action_6
action_86 (22) = happyShift action_71
action_86 (28) = happyShift action_7
action_86 (29) = happyShift action_72
action_86 (31) = happyShift action_8
action_86 (34) = happyShift action_73
action_86 (35) = happyShift action_74
action_86 (36) = happyShift action_75
action_86 (46) = happyShift action_76
action_86 (52) = happyShift action_9
action_86 (53) = happyShift action_77
action_86 (13) = happyGoto action_116
action_86 (14) = happyGoto action_69
action_86 (17) = happyGoto action_70
action_86 _ = happyFail

action_87 (21) = happyShift action_6
action_87 (22) = happyShift action_71
action_87 (28) = happyShift action_7
action_87 (29) = happyShift action_72
action_87 (31) = happyShift action_8
action_87 (34) = happyShift action_73
action_87 (35) = happyShift action_74
action_87 (36) = happyShift action_75
action_87 (46) = happyShift action_76
action_87 (52) = happyShift action_9
action_87 (53) = happyShift action_77
action_87 (13) = happyGoto action_115
action_87 (14) = happyGoto action_69
action_87 (17) = happyGoto action_70
action_87 _ = happyFail

action_88 (21) = happyShift action_6
action_88 (22) = happyShift action_71
action_88 (28) = happyShift action_7
action_88 (29) = happyShift action_72
action_88 (31) = happyShift action_8
action_88 (34) = happyShift action_73
action_88 (35) = happyShift action_74
action_88 (36) = happyShift action_75
action_88 (46) = happyShift action_76
action_88 (52) = happyShift action_9
action_88 (53) = happyShift action_77
action_88 (13) = happyGoto action_114
action_88 (14) = happyGoto action_69
action_88 (17) = happyGoto action_70
action_88 _ = happyFail

action_89 (45) = happyShift action_113
action_89 _ = happyFail

action_90 (21) = happyShift action_6
action_90 (24) = happyShift action_53
action_90 (26) = happyShift action_54
action_90 (27) = happyShift action_55
action_90 (28) = happyShift action_7
action_90 (31) = happyShift action_8
action_90 (50) = happyShift action_56
action_90 (52) = happyShift action_9
action_90 (11) = happyGoto action_112
action_90 (17) = happyGoto action_58
action_90 _ = happyFail

action_91 (21) = happyShift action_6
action_91 (24) = happyShift action_53
action_91 (26) = happyShift action_54
action_91 (27) = happyShift action_55
action_91 (28) = happyShift action_7
action_91 (31) = happyShift action_8
action_91 (50) = happyShift action_56
action_91 (52) = happyShift action_9
action_91 (11) = happyGoto action_111
action_91 (17) = happyGoto action_58
action_91 _ = happyFail

action_92 _ = happyReduce_20

action_93 (42) = happyShift action_110
action_93 _ = happyFail

action_94 (37) = happyShift action_84
action_94 (38) = happyShift action_85
action_94 (39) = happyShift action_86
action_94 (40) = happyShift action_87
action_94 (41) = happyShift action_88
action_94 (47) = happyShift action_109
action_94 _ = happyFail

action_95 _ = happyReduce_32

action_96 (46) = happyShift action_108
action_96 _ = happyFail

action_97 (48) = happyShift action_107
action_97 _ = happyFail

action_98 (21) = happyShift action_6
action_98 (28) = happyShift action_106
action_98 (31) = happyShift action_8
action_98 (52) = happyShift action_9
action_98 (17) = happyGoto action_105
action_98 _ = happyFail

action_99 (21) = happyShift action_6
action_99 (22) = happyShift action_71
action_99 (28) = happyShift action_7
action_99 (29) = happyShift action_72
action_99 (31) = happyShift action_8
action_99 (34) = happyShift action_73
action_99 (35) = happyShift action_74
action_99 (36) = happyShift action_75
action_99 (46) = happyShift action_76
action_99 (52) = happyShift action_9
action_99 (53) = happyShift action_77
action_99 (13) = happyGoto action_104
action_99 (14) = happyGoto action_69
action_99 (17) = happyGoto action_70
action_99 _ = happyFail

action_100 (51) = happyShift action_103
action_100 _ = happyFail

action_101 (51) = happyShift action_102
action_101 _ = happyFail

action_102 _ = happyReduce_2

action_103 (19) = happyShift action_22
action_103 (8) = happyGoto action_125
action_103 _ = happyReduce_8

action_104 (37) = happyShift action_84
action_104 (38) = happyShift action_85
action_104 (39) = happyShift action_86
action_104 (40) = happyShift action_87
action_104 (41) = happyShift action_88
action_104 (49) = happyShift action_124
action_104 _ = happyFail

action_105 (46) = happyShift action_123
action_105 _ = happyFail

action_106 (46) = happyReduce_47
action_106 _ = happyReduce_40

action_107 (21) = happyShift action_6
action_107 (22) = happyShift action_71
action_107 (28) = happyShift action_7
action_107 (29) = happyShift action_72
action_107 (31) = happyShift action_8
action_107 (34) = happyShift action_73
action_107 (35) = happyShift action_74
action_107 (36) = happyShift action_75
action_107 (46) = happyShift action_76
action_107 (52) = happyShift action_9
action_107 (53) = happyShift action_77
action_107 (13) = happyGoto action_122
action_107 (14) = happyGoto action_69
action_107 (17) = happyGoto action_70
action_107 _ = happyFail

action_108 (47) = happyShift action_121
action_108 _ = happyFail

action_109 _ = happyReduce_34

action_110 (21) = happyShift action_6
action_110 (22) = happyShift action_71
action_110 (28) = happyShift action_7
action_110 (29) = happyShift action_72
action_110 (31) = happyShift action_8
action_110 (34) = happyShift action_73
action_110 (35) = happyShift action_74
action_110 (36) = happyShift action_75
action_110 (46) = happyShift action_76
action_110 (52) = happyShift action_9
action_110 (53) = happyShift action_77
action_110 (13) = happyGoto action_120
action_110 (14) = happyGoto action_69
action_110 (17) = happyGoto action_70
action_110 _ = happyFail

action_111 (25) = happyShift action_119
action_111 _ = happyFail

action_112 _ = happyReduce_18

action_113 _ = happyReduce_19

action_114 _ = happyReduce_27

action_115 (41) = happyShift action_88
action_115 _ = happyReduce_26

action_116 (41) = happyShift action_88
action_116 _ = happyReduce_25

action_117 (38) = happyFail
action_117 (39) = happyShift action_86
action_117 (40) = happyShift action_87
action_117 (41) = happyShift action_88
action_117 _ = happyReduce_28

action_118 (38) = happyShift action_85
action_118 (39) = happyShift action_86
action_118 (40) = happyShift action_87
action_118 (41) = happyShift action_88
action_118 _ = happyReduce_24

action_119 (21) = happyShift action_6
action_119 (24) = happyShift action_53
action_119 (26) = happyShift action_54
action_119 (27) = happyShift action_55
action_119 (28) = happyShift action_7
action_119 (31) = happyShift action_8
action_119 (50) = happyShift action_56
action_119 (52) = happyShift action_9
action_119 (11) = happyGoto action_130
action_119 (17) = happyGoto action_58
action_119 _ = happyFail

action_120 (37) = happyShift action_84
action_120 (38) = happyShift action_85
action_120 (39) = happyShift action_86
action_120 (40) = happyShift action_87
action_120 (41) = happyShift action_88
action_120 (45) = happyShift action_129
action_120 _ = happyFail

action_121 _ = happyReduce_38

action_122 (37) = happyShift action_84
action_122 (38) = happyShift action_85
action_122 (39) = happyShift action_86
action_122 (40) = happyShift action_87
action_122 (41) = happyShift action_88
action_122 (49) = happyShift action_128
action_122 _ = happyFail

action_123 (21) = happyShift action_6
action_123 (22) = happyShift action_71
action_123 (28) = happyShift action_7
action_123 (29) = happyShift action_72
action_123 (31) = happyShift action_8
action_123 (34) = happyShift action_73
action_123 (35) = happyShift action_74
action_123 (36) = happyShift action_75
action_123 (46) = happyShift action_76
action_123 (52) = happyShift action_9
action_123 (53) = happyShift action_77
action_123 (13) = happyGoto action_126
action_123 (14) = happyGoto action_69
action_123 (15) = happyGoto action_127
action_123 (17) = happyGoto action_70
action_123 _ = happyReduce_43

action_124 _ = happyReduce_39

action_125 _ = happyReduce_7

action_126 (37) = happyShift action_84
action_126 (38) = happyShift action_85
action_126 (39) = happyShift action_86
action_126 (40) = happyShift action_87
action_126 (41) = happyShift action_88
action_126 (43) = happyShift action_133
action_126 (16) = happyGoto action_132
action_126 _ = happyReduce_45

action_127 (47) = happyShift action_131
action_127 _ = happyFail

action_128 _ = happyReduce_37

action_129 _ = happyReduce_21

action_130 _ = happyReduce_17

action_131 _ = happyReduce_41

action_132 _ = happyReduce_42

action_133 (21) = happyShift action_6
action_133 (22) = happyShift action_71
action_133 (28) = happyShift action_7
action_133 (29) = happyShift action_72
action_133 (31) = happyShift action_8
action_133 (34) = happyShift action_73
action_133 (35) = happyShift action_74
action_133 (36) = happyShift action_75
action_133 (46) = happyShift action_76
action_133 (52) = happyShift action_9
action_133 (53) = happyShift action_77
action_133 (13) = happyGoto action_134
action_133 (14) = happyGoto action_69
action_133 (17) = happyGoto action_70
action_133 _ = happyFail

action_134 (37) = happyShift action_84
action_134 (38) = happyShift action_85
action_134 (39) = happyShift action_86
action_134 (40) = happyShift action_87
action_134 (41) = happyShift action_88
action_134 (43) = happyShift action_133
action_134 (16) = happyGoto action_135
action_134 _ = happyReduce_45

action_135 _ = happyReduce_44

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
	(HappyAbsSyn17  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
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
	(HappyAbsSyn17  happy_var_2) `HappyStk`
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
	(HappyAbsSyn17  happy_var_3) `HappyStk`
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
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AMethod happy_var_2 happy_var_3 (fixMap happy_var_5) (fixMap happy_var_8) (fixMap happy_var_9) (Fix happy_var_11) : happy_var_14
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_0  8 happyReduction_8
happyReduction_8  =  HappyAbsSyn8
		 ([]
	)

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AVar happy_var_1 happy_var_2 : happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  9 happyReduction_10
happyReduction_10 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([AVar happy_var_1 happy_var_2]
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  9 happyReduction_11
happyReduction_11  =  HappyAbsSyn9
		 ([]
	)

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 _
	_
	_
	 =  HappyAbsSyn10
		 (TypeIntegerArray
	)

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn10
		 (TypeBoolean
	)

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn10
		 (TypeInteger
	)

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn10
		 (TypeAppDefined happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (AStatScope (fixMap happy_var_2)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 7 11 happyReduction_17
happyReduction_17 ((HappyAbsSyn11  happy_var_7) `HappyStk`
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

happyReduce_18 = happyReduce 5 11 happyReduction_18
happyReduction_18 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AWhile (Fix happy_var_3) (Fix happy_var_5)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 11 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (APrint (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 7 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AIndexedAssignment (Fix $ AExprIdentifier happy_var_1) (Fix happy_var_3) (Fix happy_var_6)
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  12 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_0  12 happyReduction_23
happyReduction_23  =  HappyAbsSyn12
		 ([]
	)

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandLogicalAnd (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandPlus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandMinus (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandMult (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AExprOp OperandLess (Fix happy_var_1) (Fix happy_var_3)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 (HappyTerminal (TIntLiteral  happy_var_1))
	 =  HappyAbsSyn13
		 (AExprInt happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn13
		 (AExprTrue
	)

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn13
		 (AExprFalse
	)

happyReduce_32 = happySpecReduce_2  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (AExprNegation (Fix happy_var_2)
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprIdentifier happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn14
		 (AExprThis
	)

happyReduce_37 = happyReduce 5 14 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprIntArray (Fix happy_var_4)
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 4 14 happyReduction_38
happyReduction_38 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprNewObject happy_var_2
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 14 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprList (Fix happy_var_1) (Fix happy_var_3)
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_3  14 happyReduction_40
happyReduction_40 _
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (AExprLength (Fix happy_var_1)
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happyReduce 6 14 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprInvocation (Fix happy_var_1) happy_var_3 (fixMap happy_var_5)
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_2  15 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_0  15 happyReduction_43
happyReduction_43  =  HappyAbsSyn15
		 ([]
	)

happyReduce_44 = happySpecReduce_3  16 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  16 happyReduction_45
happyReduction_45  =  HappyAbsSyn16
		 ([]
	)

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  17 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn17
		 ("length"
	)

happyReduce_48 = happySpecReduce_1  17 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn17
		 ("main"
	)

happyReduce_49 = happySpecReduce_1  17 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn17
		 ("String"
	)

happyNewToken action sts stk [] =
	action 54 54 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TClass -> cont 18;
	TPublic -> cont 19;
	TStatic -> cont 20;
	TMain -> cont 21;
	TNew -> cont 22;
	TReturn -> cont 23;
	TIf -> cont 24;
	TElse -> cont 25;
	TWhile -> cont 26;
	TPrint -> cont 27;
	TLength -> cont 28;
	TThis -> cont 29;
	TVoid -> cont 30;
	TString -> cont 31;
	TInt -> cont 32;
	TBoolean -> cont 33;
	TTrue -> cont 34;
	TFalse -> cont 35;
	TNegation -> cont 36;
	TLogicAnd -> cont 37;
	TCompareLess -> cont 38;
	TAdd -> cont 39;
	TSub -> cont 40;
	TMul -> cont 41;
	TAssignment -> cont 42;
	TComma -> cont 43;
	TDot -> cont 44;
	TSemiColon -> cont 45;
	TLeftParen -> cont 46;
	TRightParen -> cont 47;
	TLeftBracket -> cont 48;
	TRightBracket -> cont 49;
	TLeftBrace -> cont 50;
	TRightBrace -> cont 51;
	TIdLiteral happy_dollar_dollar -> cont 52;
	TIntLiteral  happy_dollar_dollar -> cont 53;
	_ -> happyError' (tk:tks)
	}

happyError_ 54 tk tks = happyError' tks
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


mainMethod arg vars code = AMethod TypeVoid "main" [Fix $ AVar TypeStringArray arg] (fixMap vars) (fixMap code) (Fix AExprVoid)

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
