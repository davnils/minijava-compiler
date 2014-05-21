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

action_2 (18) = happyShift action_9
action_2 (6) = happyGoto action_8
action_2 _ = happyReduce_4

action_3 (21) = happyShift action_6
action_3 (52) = happyShift action_7
action_3 (17) = happyGoto action_5
action_3 _ = happyFail

action_4 (54) = happyAccept
action_4 _ = happyFail

action_5 (50) = happyShift action_11
action_5 _ = happyFail

action_6 _ = happyReduce_48

action_7 _ = happyReduce_47

action_8 _ = happyReduce_1

action_9 (21) = happyShift action_6
action_9 (52) = happyShift action_7
action_9 (17) = happyGoto action_10
action_9 _ = happyFail

action_10 (50) = happyShift action_13
action_10 _ = happyFail

action_11 (19) = happyShift action_12
action_11 _ = happyFail

action_12 (20) = happyShift action_15
action_12 _ = happyFail

action_13 (7) = happyGoto action_14
action_13 _ = happyReduce_5

action_14 (19) = happyShift action_20
action_14 (21) = happyShift action_6
action_14 (32) = happyShift action_21
action_14 (33) = happyShift action_22
action_14 (52) = happyShift action_7
action_14 (8) = happyGoto action_17
action_14 (10) = happyGoto action_18
action_14 (17) = happyGoto action_19
action_14 _ = happyReduce_8

action_15 (30) = happyShift action_16
action_15 _ = happyFail

action_16 (21) = happyShift action_27
action_16 _ = happyFail

action_17 (51) = happyShift action_26
action_17 _ = happyFail

action_18 (21) = happyShift action_6
action_18 (52) = happyShift action_7
action_18 (17) = happyGoto action_25
action_18 _ = happyFail

action_19 _ = happyReduce_15

action_20 (21) = happyShift action_6
action_20 (32) = happyShift action_21
action_20 (33) = happyShift action_22
action_20 (52) = happyShift action_7
action_20 (10) = happyGoto action_24
action_20 (17) = happyGoto action_19
action_20 _ = happyFail

action_21 (48) = happyShift action_23
action_21 _ = happyReduce_14

action_22 _ = happyReduce_13

action_23 (49) = happyShift action_32
action_23 _ = happyFail

action_24 (21) = happyShift action_6
action_24 (52) = happyShift action_7
action_24 (17) = happyGoto action_31
action_24 _ = happyFail

action_25 (45) = happyShift action_30
action_25 _ = happyFail

action_26 (18) = happyShift action_9
action_26 (6) = happyGoto action_29
action_26 _ = happyReduce_4

action_27 (46) = happyShift action_28
action_27 _ = happyFail

action_28 (31) = happyShift action_34
action_28 _ = happyFail

action_29 _ = happyReduce_3

action_30 _ = happyReduce_6

action_31 (46) = happyShift action_33
action_31 _ = happyFail

action_32 _ = happyReduce_12

action_33 (21) = happyShift action_6
action_33 (32) = happyShift action_21
action_33 (33) = happyShift action_22
action_33 (52) = happyShift action_7
action_33 (9) = happyGoto action_36
action_33 (10) = happyGoto action_37
action_33 (17) = happyGoto action_19
action_33 _ = happyReduce_11

action_34 (48) = happyShift action_35
action_34 _ = happyFail

action_35 (49) = happyShift action_40
action_35 _ = happyFail

action_36 (47) = happyShift action_39
action_36 _ = happyFail

action_37 (21) = happyShift action_6
action_37 (52) = happyShift action_7
action_37 (17) = happyGoto action_38
action_37 _ = happyFail

action_38 (43) = happyShift action_43
action_38 _ = happyReduce_10

action_39 (50) = happyShift action_42
action_39 _ = happyFail

action_40 (21) = happyShift action_6
action_40 (52) = happyShift action_7
action_40 (17) = happyGoto action_41
action_40 _ = happyFail

action_41 (47) = happyShift action_46
action_41 _ = happyFail

action_42 (7) = happyGoto action_45
action_42 _ = happyReduce_5

action_43 (21) = happyShift action_6
action_43 (32) = happyShift action_21
action_43 (33) = happyShift action_22
action_43 (52) = happyShift action_7
action_43 (9) = happyGoto action_44
action_43 (10) = happyGoto action_37
action_43 (17) = happyGoto action_19
action_43 _ = happyReduce_11

action_44 _ = happyReduce_9

action_45 (21) = happyShift action_6
action_45 (24) = happyShift action_51
action_45 (26) = happyShift action_52
action_45 (27) = happyShift action_53
action_45 (32) = happyShift action_21
action_45 (33) = happyShift action_22
action_45 (50) = happyShift action_54
action_45 (52) = happyShift action_7
action_45 (10) = happyGoto action_18
action_45 (11) = happyGoto action_48
action_45 (12) = happyGoto action_49
action_45 (17) = happyGoto action_50
action_45 _ = happyReduce_24

action_46 (50) = happyShift action_47
action_46 _ = happyFail

action_47 (7) = happyGoto action_64
action_47 _ = happyReduce_5

action_48 (21) = happyShift action_6
action_48 (24) = happyShift action_51
action_48 (26) = happyShift action_52
action_48 (27) = happyShift action_53
action_48 (50) = happyShift action_54
action_48 (52) = happyShift action_7
action_48 (11) = happyGoto action_48
action_48 (12) = happyGoto action_63
action_48 (17) = happyGoto action_56
action_48 _ = happyReduce_24

action_49 (23) = happyShift action_62
action_49 _ = happyFail

action_50 (42) = happyShift action_60
action_50 (48) = happyShift action_61
action_50 _ = happyReduce_15

action_51 (46) = happyShift action_59
action_51 _ = happyFail

action_52 (46) = happyShift action_58
action_52 _ = happyFail

action_53 (46) = happyShift action_57
action_53 _ = happyFail

action_54 (21) = happyShift action_6
action_54 (24) = happyShift action_51
action_54 (26) = happyShift action_52
action_54 (27) = happyShift action_53
action_54 (50) = happyShift action_54
action_54 (52) = happyShift action_7
action_54 (11) = happyGoto action_48
action_54 (12) = happyGoto action_55
action_54 (17) = happyGoto action_56
action_54 _ = happyReduce_24

action_55 (51) = happyShift action_81
action_55 _ = happyFail

action_56 (42) = happyShift action_60
action_56 (48) = happyShift action_61
action_56 _ = happyFail

action_57 (21) = happyShift action_6
action_57 (22) = happyShift action_69
action_57 (29) = happyShift action_70
action_57 (34) = happyShift action_71
action_57 (35) = happyShift action_72
action_57 (36) = happyShift action_73
action_57 (46) = happyShift action_74
action_57 (52) = happyShift action_7
action_57 (53) = happyShift action_75
action_57 (13) = happyGoto action_80
action_57 (14) = happyGoto action_67
action_57 (17) = happyGoto action_68
action_57 _ = happyFail

action_58 (21) = happyShift action_6
action_58 (22) = happyShift action_69
action_58 (29) = happyShift action_70
action_58 (34) = happyShift action_71
action_58 (35) = happyShift action_72
action_58 (36) = happyShift action_73
action_58 (46) = happyShift action_74
action_58 (52) = happyShift action_7
action_58 (53) = happyShift action_75
action_58 (13) = happyGoto action_79
action_58 (14) = happyGoto action_67
action_58 (17) = happyGoto action_68
action_58 _ = happyFail

action_59 (21) = happyShift action_6
action_59 (22) = happyShift action_69
action_59 (29) = happyShift action_70
action_59 (34) = happyShift action_71
action_59 (35) = happyShift action_72
action_59 (36) = happyShift action_73
action_59 (46) = happyShift action_74
action_59 (52) = happyShift action_7
action_59 (53) = happyShift action_75
action_59 (13) = happyGoto action_78
action_59 (14) = happyGoto action_67
action_59 (17) = happyGoto action_68
action_59 _ = happyFail

action_60 (21) = happyShift action_6
action_60 (22) = happyShift action_69
action_60 (29) = happyShift action_70
action_60 (34) = happyShift action_71
action_60 (35) = happyShift action_72
action_60 (36) = happyShift action_73
action_60 (46) = happyShift action_74
action_60 (52) = happyShift action_7
action_60 (53) = happyShift action_75
action_60 (13) = happyGoto action_77
action_60 (14) = happyGoto action_67
action_60 (17) = happyGoto action_68
action_60 _ = happyFail

action_61 (21) = happyShift action_6
action_61 (22) = happyShift action_69
action_61 (29) = happyShift action_70
action_61 (34) = happyShift action_71
action_61 (35) = happyShift action_72
action_61 (36) = happyShift action_73
action_61 (46) = happyShift action_74
action_61 (52) = happyShift action_7
action_61 (53) = happyShift action_75
action_61 (13) = happyGoto action_76
action_61 (14) = happyGoto action_67
action_61 (17) = happyGoto action_68
action_61 _ = happyFail

action_62 (21) = happyShift action_6
action_62 (22) = happyShift action_69
action_62 (29) = happyShift action_70
action_62 (34) = happyShift action_71
action_62 (35) = happyShift action_72
action_62 (36) = happyShift action_73
action_62 (46) = happyShift action_74
action_62 (52) = happyShift action_7
action_62 (53) = happyShift action_75
action_62 (13) = happyGoto action_66
action_62 (14) = happyGoto action_67
action_62 (17) = happyGoto action_68
action_62 _ = happyFail

action_63 _ = happyReduce_23

action_64 (21) = happyShift action_6
action_64 (24) = happyShift action_51
action_64 (26) = happyShift action_52
action_64 (27) = happyShift action_53
action_64 (32) = happyShift action_21
action_64 (33) = happyShift action_22
action_64 (50) = happyShift action_54
action_64 (52) = happyShift action_7
action_64 (10) = happyGoto action_18
action_64 (11) = happyGoto action_48
action_64 (12) = happyGoto action_65
action_64 (17) = happyGoto action_50
action_64 _ = happyReduce_24

action_65 (51) = happyShift action_99
action_65 _ = happyFail

action_66 (37) = happyShift action_82
action_66 (38) = happyShift action_83
action_66 (39) = happyShift action_84
action_66 (40) = happyShift action_85
action_66 (41) = happyShift action_86
action_66 (45) = happyShift action_98
action_66 _ = happyFail

action_67 (44) = happyShift action_96
action_67 (48) = happyShift action_97
action_67 _ = happyReduce_34

action_68 _ = happyReduce_36

action_69 (21) = happyShift action_6
action_69 (32) = happyShift action_95
action_69 (52) = happyShift action_7
action_69 (17) = happyGoto action_94
action_69 _ = happyFail

action_70 _ = happyReduce_37

action_71 _ = happyReduce_31

action_72 _ = happyReduce_32

action_73 (21) = happyShift action_6
action_73 (22) = happyShift action_69
action_73 (29) = happyShift action_70
action_73 (34) = happyShift action_71
action_73 (35) = happyShift action_72
action_73 (36) = happyShift action_73
action_73 (46) = happyShift action_74
action_73 (52) = happyShift action_7
action_73 (53) = happyShift action_75
action_73 (13) = happyGoto action_93
action_73 (14) = happyGoto action_67
action_73 (17) = happyGoto action_68
action_73 _ = happyFail

action_74 (21) = happyShift action_6
action_74 (22) = happyShift action_69
action_74 (29) = happyShift action_70
action_74 (34) = happyShift action_71
action_74 (35) = happyShift action_72
action_74 (36) = happyShift action_73
action_74 (46) = happyShift action_74
action_74 (52) = happyShift action_7
action_74 (53) = happyShift action_75
action_74 (13) = happyGoto action_92
action_74 (14) = happyGoto action_67
action_74 (17) = happyGoto action_68
action_74 _ = happyFail

action_75 _ = happyReduce_30

action_76 (37) = happyShift action_82
action_76 (38) = happyShift action_83
action_76 (39) = happyShift action_84
action_76 (40) = happyShift action_85
action_76 (41) = happyShift action_86
action_76 (49) = happyShift action_91
action_76 _ = happyFail

action_77 (37) = happyShift action_82
action_77 (38) = happyShift action_83
action_77 (39) = happyShift action_84
action_77 (40) = happyShift action_85
action_77 (41) = happyShift action_86
action_77 (45) = happyShift action_90
action_77 _ = happyFail

action_78 (37) = happyShift action_82
action_78 (38) = happyShift action_83
action_78 (39) = happyShift action_84
action_78 (40) = happyShift action_85
action_78 (41) = happyShift action_86
action_78 (47) = happyShift action_89
action_78 _ = happyFail

action_79 (37) = happyShift action_82
action_79 (38) = happyShift action_83
action_79 (39) = happyShift action_84
action_79 (40) = happyShift action_85
action_79 (41) = happyShift action_86
action_79 (47) = happyShift action_88
action_79 _ = happyFail

action_80 (37) = happyShift action_82
action_80 (38) = happyShift action_83
action_80 (39) = happyShift action_84
action_80 (40) = happyShift action_85
action_80 (41) = happyShift action_86
action_80 (47) = happyShift action_87
action_80 _ = happyFail

action_81 _ = happyReduce_16

action_82 (21) = happyShift action_6
action_82 (22) = happyShift action_69
action_82 (29) = happyShift action_70
action_82 (34) = happyShift action_71
action_82 (35) = happyShift action_72
action_82 (36) = happyShift action_73
action_82 (46) = happyShift action_74
action_82 (52) = happyShift action_7
action_82 (53) = happyShift action_75
action_82 (13) = happyGoto action_116
action_82 (14) = happyGoto action_67
action_82 (17) = happyGoto action_68
action_82 _ = happyFail

action_83 (21) = happyShift action_6
action_83 (22) = happyShift action_69
action_83 (29) = happyShift action_70
action_83 (34) = happyShift action_71
action_83 (35) = happyShift action_72
action_83 (36) = happyShift action_73
action_83 (46) = happyShift action_74
action_83 (52) = happyShift action_7
action_83 (53) = happyShift action_75
action_83 (13) = happyGoto action_115
action_83 (14) = happyGoto action_67
action_83 (17) = happyGoto action_68
action_83 _ = happyFail

action_84 (21) = happyShift action_6
action_84 (22) = happyShift action_69
action_84 (29) = happyShift action_70
action_84 (34) = happyShift action_71
action_84 (35) = happyShift action_72
action_84 (36) = happyShift action_73
action_84 (46) = happyShift action_74
action_84 (52) = happyShift action_7
action_84 (53) = happyShift action_75
action_84 (13) = happyGoto action_114
action_84 (14) = happyGoto action_67
action_84 (17) = happyGoto action_68
action_84 _ = happyFail

action_85 (21) = happyShift action_6
action_85 (22) = happyShift action_69
action_85 (29) = happyShift action_70
action_85 (34) = happyShift action_71
action_85 (35) = happyShift action_72
action_85 (36) = happyShift action_73
action_85 (46) = happyShift action_74
action_85 (52) = happyShift action_7
action_85 (53) = happyShift action_75
action_85 (13) = happyGoto action_113
action_85 (14) = happyGoto action_67
action_85 (17) = happyGoto action_68
action_85 _ = happyFail

action_86 (21) = happyShift action_6
action_86 (22) = happyShift action_69
action_86 (29) = happyShift action_70
action_86 (34) = happyShift action_71
action_86 (35) = happyShift action_72
action_86 (36) = happyShift action_73
action_86 (46) = happyShift action_74
action_86 (52) = happyShift action_7
action_86 (53) = happyShift action_75
action_86 (13) = happyGoto action_112
action_86 (14) = happyGoto action_67
action_86 (17) = happyGoto action_68
action_86 _ = happyFail

action_87 (45) = happyShift action_111
action_87 _ = happyFail

action_88 (21) = happyShift action_6
action_88 (24) = happyShift action_51
action_88 (26) = happyShift action_52
action_88 (27) = happyShift action_53
action_88 (50) = happyShift action_54
action_88 (52) = happyShift action_7
action_88 (11) = happyGoto action_110
action_88 (17) = happyGoto action_56
action_88 _ = happyFail

action_89 (21) = happyShift action_6
action_89 (24) = happyShift action_51
action_89 (26) = happyShift action_52
action_89 (27) = happyShift action_53
action_89 (50) = happyShift action_54
action_89 (52) = happyShift action_7
action_89 (11) = happyGoto action_109
action_89 (17) = happyGoto action_56
action_89 _ = happyFail

action_90 _ = happyReduce_21

action_91 (42) = happyShift action_108
action_91 _ = happyFail

action_92 (37) = happyShift action_82
action_92 (38) = happyShift action_83
action_92 (39) = happyShift action_84
action_92 (40) = happyShift action_85
action_92 (41) = happyShift action_86
action_92 (47) = happyShift action_107
action_92 _ = happyFail

action_93 _ = happyReduce_33

action_94 (46) = happyShift action_106
action_94 _ = happyFail

action_95 (48) = happyShift action_105
action_95 _ = happyFail

action_96 (21) = happyShift action_6
action_96 (28) = happyShift action_104
action_96 (52) = happyShift action_7
action_96 (17) = happyGoto action_103
action_96 _ = happyFail

action_97 (21) = happyShift action_6
action_97 (22) = happyShift action_69
action_97 (29) = happyShift action_70
action_97 (34) = happyShift action_71
action_97 (35) = happyShift action_72
action_97 (36) = happyShift action_73
action_97 (46) = happyShift action_74
action_97 (52) = happyShift action_7
action_97 (53) = happyShift action_75
action_97 (13) = happyGoto action_102
action_97 (14) = happyGoto action_67
action_97 (17) = happyGoto action_68
action_97 _ = happyFail

action_98 (51) = happyShift action_101
action_98 _ = happyFail

action_99 (51) = happyShift action_100
action_99 _ = happyFail

action_100 _ = happyReduce_2

action_101 (19) = happyShift action_20
action_101 (8) = happyGoto action_123
action_101 _ = happyReduce_8

action_102 (37) = happyShift action_82
action_102 (38) = happyShift action_83
action_102 (39) = happyShift action_84
action_102 (40) = happyShift action_85
action_102 (41) = happyShift action_86
action_102 (49) = happyShift action_122
action_102 _ = happyFail

action_103 (46) = happyShift action_121
action_103 _ = happyFail

action_104 _ = happyReduce_41

action_105 (21) = happyShift action_6
action_105 (22) = happyShift action_69
action_105 (29) = happyShift action_70
action_105 (34) = happyShift action_71
action_105 (35) = happyShift action_72
action_105 (36) = happyShift action_73
action_105 (46) = happyShift action_74
action_105 (52) = happyShift action_7
action_105 (53) = happyShift action_75
action_105 (13) = happyGoto action_120
action_105 (14) = happyGoto action_67
action_105 (17) = happyGoto action_68
action_105 _ = happyFail

action_106 (47) = happyShift action_119
action_106 _ = happyFail

action_107 _ = happyReduce_35

action_108 (21) = happyShift action_6
action_108 (22) = happyShift action_69
action_108 (29) = happyShift action_70
action_108 (34) = happyShift action_71
action_108 (35) = happyShift action_72
action_108 (36) = happyShift action_73
action_108 (46) = happyShift action_74
action_108 (52) = happyShift action_7
action_108 (53) = happyShift action_75
action_108 (13) = happyGoto action_118
action_108 (14) = happyGoto action_67
action_108 (17) = happyGoto action_68
action_108 _ = happyFail

action_109 (25) = happyShift action_117
action_109 _ = happyReduce_18

action_110 _ = happyReduce_19

action_111 _ = happyReduce_20

action_112 _ = happyReduce_28

action_113 (41) = happyShift action_86
action_113 _ = happyReduce_27

action_114 (41) = happyShift action_86
action_114 _ = happyReduce_26

action_115 (38) = happyFail
action_115 (39) = happyShift action_84
action_115 (40) = happyShift action_85
action_115 (41) = happyShift action_86
action_115 _ = happyReduce_29

action_116 (38) = happyShift action_83
action_116 (39) = happyShift action_84
action_116 (40) = happyShift action_85
action_116 (41) = happyShift action_86
action_116 _ = happyReduce_25

action_117 (21) = happyShift action_6
action_117 (24) = happyShift action_51
action_117 (26) = happyShift action_52
action_117 (27) = happyShift action_53
action_117 (50) = happyShift action_54
action_117 (52) = happyShift action_7
action_117 (11) = happyGoto action_128
action_117 (17) = happyGoto action_56
action_117 _ = happyFail

action_118 (37) = happyShift action_82
action_118 (38) = happyShift action_83
action_118 (39) = happyShift action_84
action_118 (40) = happyShift action_85
action_118 (41) = happyShift action_86
action_118 (45) = happyShift action_127
action_118 _ = happyFail

action_119 _ = happyReduce_39

action_120 (37) = happyShift action_82
action_120 (38) = happyShift action_83
action_120 (39) = happyShift action_84
action_120 (40) = happyShift action_85
action_120 (41) = happyShift action_86
action_120 (49) = happyShift action_126
action_120 _ = happyFail

action_121 (21) = happyShift action_6
action_121 (22) = happyShift action_69
action_121 (29) = happyShift action_70
action_121 (34) = happyShift action_71
action_121 (35) = happyShift action_72
action_121 (36) = happyShift action_73
action_121 (46) = happyShift action_74
action_121 (52) = happyShift action_7
action_121 (53) = happyShift action_75
action_121 (13) = happyGoto action_124
action_121 (14) = happyGoto action_67
action_121 (15) = happyGoto action_125
action_121 (17) = happyGoto action_68
action_121 _ = happyReduce_44

action_122 _ = happyReduce_40

action_123 _ = happyReduce_7

action_124 (37) = happyShift action_82
action_124 (38) = happyShift action_83
action_124 (39) = happyShift action_84
action_124 (40) = happyShift action_85
action_124 (41) = happyShift action_86
action_124 (43) = happyShift action_131
action_124 (16) = happyGoto action_130
action_124 _ = happyReduce_46

action_125 (47) = happyShift action_129
action_125 _ = happyFail

action_126 _ = happyReduce_38

action_127 _ = happyReduce_22

action_128 _ = happyReduce_17

action_129 _ = happyReduce_42

action_130 _ = happyReduce_43

action_131 (21) = happyShift action_6
action_131 (22) = happyShift action_69
action_131 (29) = happyShift action_70
action_131 (34) = happyShift action_71
action_131 (35) = happyShift action_72
action_131 (36) = happyShift action_73
action_131 (46) = happyShift action_74
action_131 (52) = happyShift action_7
action_131 (53) = happyShift action_75
action_131 (13) = happyGoto action_132
action_131 (14) = happyGoto action_67
action_131 (17) = happyGoto action_68
action_131 _ = happyFail

action_132 (37) = happyShift action_82
action_132 (38) = happyShift action_83
action_132 (39) = happyShift action_84
action_132 (40) = happyShift action_85
action_132 (41) = happyShift action_86
action_132 (43) = happyShift action_131
action_132 (16) = happyGoto action_133
action_132 _ = happyReduce_46

action_133 _ = happyReduce_45

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
		 (AIf (Fix happy_var_3) (Fix happy_var_5) (Fix $ AStatScope [])
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
	(HappyAbsSyn17  happy_var_1) `HappyStk`
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
	(HappyAbsSyn17  happy_var_1) `HappyStk`
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
happyReduction_36 (HappyAbsSyn17  happy_var_1)
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
	(HappyAbsSyn17  happy_var_2) `HappyStk`
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
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AExprInvocation (Fix happy_var_1) happy_var_3 (fixMap happy_var_5)
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_2  15 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  15 happyReduction_44
happyReduction_44  =  HappyAbsSyn15
		 ([]
	)

happyReduce_45 = happySpecReduce_3  16 happyReduction_45
happyReduction_45 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_0  16 happyReduction_46
happyReduction_46  =  HappyAbsSyn16
		 ([]
	)

happyReduce_47 = happySpecReduce_1  17 happyReduction_47
happyReduction_47 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  17 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn17
		 ("main"
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
