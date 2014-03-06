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

action_3 (53) = happyShift action_5
action_3 _ = happyFail

action_4 (56) = happyAccept
action_4 _ = happyFail

action_5 (49) = happyShift action_9
action_5 _ = happyFail

action_6 _ = happyReduce_1

action_7 (53) = happyShift action_8
action_7 _ = happyFail

action_8 (49) = happyShift action_11
action_8 _ = happyFail

action_9 (18) = happyShift action_10
action_9 _ = happyFail

action_10 (19) = happyShift action_17
action_10 _ = happyFail

action_11 (31) = happyShift action_14
action_11 (32) = happyShift action_15
action_11 (53) = happyShift action_16
action_11 (7) = happyGoto action_12
action_11 (10) = happyGoto action_13
action_11 _ = happyReduce_6

action_12 (18) = happyShift action_22
action_12 (8) = happyGoto action_21
action_12 _ = happyReduce_8

action_13 (53) = happyShift action_20
action_13 _ = happyFail

action_14 (47) = happyShift action_19
action_14 _ = happyReduce_14

action_15 _ = happyReduce_13

action_16 _ = happyReduce_15

action_17 (29) = happyShift action_18
action_17 _ = happyFail

action_18 (20) = happyShift action_27
action_18 _ = happyFail

action_19 (48) = happyShift action_26
action_19 _ = happyFail

action_20 (44) = happyShift action_25
action_20 _ = happyFail

action_21 (50) = happyShift action_24
action_21 _ = happyFail

action_22 (31) = happyShift action_14
action_22 (32) = happyShift action_15
action_22 (53) = happyShift action_16
action_22 (10) = happyGoto action_23
action_22 _ = happyFail

action_23 (53) = happyShift action_31
action_23 _ = happyFail

action_24 (17) = happyShift action_7
action_24 (6) = happyGoto action_30
action_24 _ = happyReduce_4

action_25 (31) = happyShift action_14
action_25 (32) = happyShift action_15
action_25 (53) = happyShift action_16
action_25 (7) = happyGoto action_29
action_25 (10) = happyGoto action_13
action_25 _ = happyReduce_6

action_26 _ = happyReduce_12

action_27 (45) = happyShift action_28
action_27 _ = happyFail

action_28 (30) = happyShift action_33
action_28 _ = happyFail

action_29 _ = happyReduce_5

action_30 _ = happyReduce_3

action_31 (45) = happyShift action_32
action_31 _ = happyFail

action_32 (31) = happyShift action_14
action_32 (32) = happyShift action_15
action_32 (53) = happyShift action_16
action_32 (9) = happyGoto action_35
action_32 (10) = happyGoto action_36
action_32 _ = happyReduce_11

action_33 (47) = happyShift action_34
action_33 _ = happyFail

action_34 (48) = happyShift action_39
action_34 _ = happyFail

action_35 (46) = happyShift action_38
action_35 _ = happyFail

action_36 (53) = happyShift action_37
action_36 _ = happyFail

action_37 (42) = happyShift action_42
action_37 _ = happyReduce_10

action_38 (49) = happyShift action_41
action_38 _ = happyFail

action_39 (53) = happyShift action_40
action_39 _ = happyFail

action_40 (46) = happyShift action_45
action_40 _ = happyFail

action_41 (31) = happyShift action_14
action_41 (32) = happyShift action_15
action_41 (53) = happyShift action_16
action_41 (7) = happyGoto action_44
action_41 (10) = happyGoto action_13
action_41 _ = happyReduce_6

action_42 (31) = happyShift action_14
action_42 (32) = happyShift action_15
action_42 (53) = happyShift action_16
action_42 (9) = happyGoto action_43
action_42 (10) = happyGoto action_36
action_42 _ = happyReduce_11

action_43 _ = happyReduce_9

action_44 (23) = happyShift action_49
action_44 (25) = happyShift action_50
action_44 (26) = happyShift action_51
action_44 (49) = happyShift action_52
action_44 (53) = happyShift action_53
action_44 (11) = happyGoto action_47
action_44 (12) = happyGoto action_48
action_44 _ = happyReduce_23

action_45 (49) = happyShift action_46
action_45 _ = happyFail

action_46 (31) = happyShift action_14
action_46 (32) = happyShift action_15
action_46 (53) = happyShift action_16
action_46 (7) = happyGoto action_62
action_46 (10) = happyGoto action_13
action_46 _ = happyReduce_6

action_47 (23) = happyShift action_49
action_47 (25) = happyShift action_50
action_47 (26) = happyShift action_51
action_47 (49) = happyShift action_52
action_47 (53) = happyShift action_53
action_47 (11) = happyGoto action_47
action_47 (12) = happyGoto action_61
action_47 _ = happyReduce_23

action_48 (22) = happyShift action_60
action_48 _ = happyFail

action_49 (45) = happyShift action_59
action_49 _ = happyFail

action_50 (45) = happyShift action_58
action_50 _ = happyFail

action_51 (45) = happyShift action_57
action_51 _ = happyFail

action_52 (23) = happyShift action_49
action_52 (25) = happyShift action_50
action_52 (26) = happyShift action_51
action_52 (49) = happyShift action_52
action_52 (53) = happyShift action_53
action_52 (11) = happyGoto action_47
action_52 (12) = happyGoto action_56
action_52 _ = happyReduce_23

action_53 (41) = happyShift action_54
action_53 (47) = happyShift action_55
action_53 _ = happyFail

action_54 (21) = happyShift action_65
action_54 (28) = happyShift action_66
action_54 (33) = happyShift action_67
action_54 (34) = happyShift action_68
action_54 (35) = happyShift action_69
action_54 (45) = happyShift action_70
action_54 (53) = happyShift action_71
action_54 (55) = happyShift action_72
action_54 (13) = happyGoto action_78
action_54 _ = happyFail

action_55 (21) = happyShift action_65
action_55 (28) = happyShift action_66
action_55 (33) = happyShift action_67
action_55 (34) = happyShift action_68
action_55 (35) = happyShift action_69
action_55 (45) = happyShift action_70
action_55 (53) = happyShift action_71
action_55 (55) = happyShift action_72
action_55 (13) = happyGoto action_77
action_55 _ = happyFail

action_56 (50) = happyShift action_76
action_56 _ = happyFail

action_57 (21) = happyShift action_65
action_57 (28) = happyShift action_66
action_57 (33) = happyShift action_67
action_57 (34) = happyShift action_68
action_57 (35) = happyShift action_69
action_57 (45) = happyShift action_70
action_57 (53) = happyShift action_71
action_57 (55) = happyShift action_72
action_57 (13) = happyGoto action_75
action_57 _ = happyFail

action_58 (21) = happyShift action_65
action_58 (28) = happyShift action_66
action_58 (33) = happyShift action_67
action_58 (34) = happyShift action_68
action_58 (35) = happyShift action_69
action_58 (45) = happyShift action_70
action_58 (53) = happyShift action_71
action_58 (55) = happyShift action_72
action_58 (13) = happyGoto action_74
action_58 _ = happyFail

action_59 (21) = happyShift action_65
action_59 (28) = happyShift action_66
action_59 (33) = happyShift action_67
action_59 (34) = happyShift action_68
action_59 (35) = happyShift action_69
action_59 (45) = happyShift action_70
action_59 (53) = happyShift action_71
action_59 (55) = happyShift action_72
action_59 (13) = happyGoto action_73
action_59 _ = happyFail

action_60 (21) = happyShift action_65
action_60 (28) = happyShift action_66
action_60 (33) = happyShift action_67
action_60 (34) = happyShift action_68
action_60 (35) = happyShift action_69
action_60 (45) = happyShift action_70
action_60 (53) = happyShift action_71
action_60 (55) = happyShift action_72
action_60 (13) = happyGoto action_64
action_60 _ = happyFail

action_61 _ = happyReduce_22

action_62 (23) = happyShift action_49
action_62 (25) = happyShift action_50
action_62 (26) = happyShift action_51
action_62 (49) = happyShift action_52
action_62 (53) = happyShift action_53
action_62 (11) = happyGoto action_47
action_62 (12) = happyGoto action_63
action_62 _ = happyReduce_23

action_63 (50) = happyShift action_97
action_63 _ = happyFail

action_64 (36) = happyShift action_80
action_64 (37) = happyShift action_81
action_64 (38) = happyShift action_82
action_64 (39) = happyShift action_83
action_64 (40) = happyShift action_84
action_64 (43) = happyShift action_85
action_64 (44) = happyShift action_96
action_64 (47) = happyShift action_87
action_64 (14) = happyGoto action_79
action_64 _ = happyFail

action_65 (31) = happyShift action_94
action_65 (53) = happyShift action_95
action_65 _ = happyFail

action_66 _ = happyReduce_32

action_67 _ = happyReduce_29

action_68 _ = happyReduce_30

action_69 (21) = happyShift action_65
action_69 (28) = happyShift action_66
action_69 (33) = happyShift action_67
action_69 (34) = happyShift action_68
action_69 (35) = happyShift action_69
action_69 (45) = happyShift action_70
action_69 (53) = happyShift action_71
action_69 (55) = happyShift action_72
action_69 (13) = happyGoto action_93
action_69 _ = happyFail

action_70 (21) = happyShift action_65
action_70 (28) = happyShift action_66
action_70 (33) = happyShift action_67
action_70 (34) = happyShift action_68
action_70 (35) = happyShift action_69
action_70 (45) = happyShift action_70
action_70 (53) = happyShift action_71
action_70 (55) = happyShift action_72
action_70 (13) = happyGoto action_92
action_70 _ = happyFail

action_71 _ = happyReduce_31

action_72 _ = happyReduce_28

action_73 (36) = happyShift action_80
action_73 (37) = happyShift action_81
action_73 (38) = happyShift action_82
action_73 (39) = happyShift action_83
action_73 (40) = happyShift action_84
action_73 (43) = happyShift action_85
action_73 (46) = happyShift action_91
action_73 (47) = happyShift action_87
action_73 (14) = happyGoto action_79
action_73 _ = happyFail

action_74 (36) = happyShift action_80
action_74 (37) = happyShift action_81
action_74 (38) = happyShift action_82
action_74 (39) = happyShift action_83
action_74 (40) = happyShift action_84
action_74 (43) = happyShift action_85
action_74 (46) = happyShift action_90
action_74 (47) = happyShift action_87
action_74 (14) = happyGoto action_79
action_74 _ = happyFail

action_75 (36) = happyShift action_80
action_75 (37) = happyShift action_81
action_75 (38) = happyShift action_82
action_75 (39) = happyShift action_83
action_75 (40) = happyShift action_84
action_75 (43) = happyShift action_85
action_75 (46) = happyShift action_89
action_75 (47) = happyShift action_87
action_75 (14) = happyGoto action_79
action_75 _ = happyFail

action_76 _ = happyReduce_16

action_77 (36) = happyShift action_80
action_77 (37) = happyShift action_81
action_77 (38) = happyShift action_82
action_77 (39) = happyShift action_83
action_77 (40) = happyShift action_84
action_77 (43) = happyShift action_85
action_77 (47) = happyShift action_87
action_77 (48) = happyShift action_88
action_77 (14) = happyGoto action_79
action_77 _ = happyFail

action_78 (36) = happyShift action_80
action_78 (37) = happyShift action_81
action_78 (38) = happyShift action_82
action_78 (39) = happyShift action_83
action_78 (40) = happyShift action_84
action_78 (43) = happyShift action_85
action_78 (44) = happyShift action_86
action_78 (47) = happyShift action_87
action_78 (14) = happyGoto action_79
action_78 _ = happyFail

action_79 (21) = happyShift action_65
action_79 (28) = happyShift action_66
action_79 (33) = happyShift action_67
action_79 (34) = happyShift action_68
action_79 (35) = happyShift action_69
action_79 (45) = happyShift action_70
action_79 (53) = happyShift action_71
action_79 (55) = happyShift action_72
action_79 (13) = happyGoto action_110
action_79 _ = happyFail

action_80 _ = happyReduce_37

action_81 _ = happyReduce_38

action_82 _ = happyReduce_39

action_83 _ = happyReduce_40

action_84 _ = happyReduce_41

action_85 (27) = happyShift action_108
action_85 (53) = happyShift action_109
action_85 _ = happyFail

action_86 _ = happyReduce_20

action_87 (21) = happyShift action_65
action_87 (28) = happyShift action_66
action_87 (33) = happyShift action_67
action_87 (34) = happyShift action_68
action_87 (35) = happyShift action_69
action_87 (45) = happyShift action_70
action_87 (53) = happyShift action_71
action_87 (55) = happyShift action_72
action_87 (13) = happyGoto action_107
action_87 _ = happyFail

action_88 (41) = happyShift action_106
action_88 _ = happyFail

action_89 (44) = happyShift action_105
action_89 _ = happyFail

action_90 (23) = happyShift action_49
action_90 (25) = happyShift action_50
action_90 (26) = happyShift action_51
action_90 (49) = happyShift action_52
action_90 (53) = happyShift action_53
action_90 (11) = happyGoto action_104
action_90 _ = happyFail

action_91 (23) = happyShift action_49
action_91 (25) = happyShift action_50
action_91 (26) = happyShift action_51
action_91 (49) = happyShift action_52
action_91 (53) = happyShift action_53
action_91 (11) = happyGoto action_103
action_91 _ = happyFail

action_92 (36) = happyShift action_80
action_92 (37) = happyShift action_81
action_92 (38) = happyShift action_82
action_92 (39) = happyShift action_83
action_92 (40) = happyShift action_84
action_92 (43) = happyShift action_85
action_92 (46) = happyShift action_102
action_92 (47) = happyShift action_87
action_92 (14) = happyGoto action_79
action_92 _ = happyFail

action_93 (36) = happyShift action_80
action_93 (37) = happyShift action_81
action_93 (38) = happyShift action_82
action_93 (39) = happyShift action_83
action_93 (40) = happyShift action_84
action_93 (43) = happyShift action_85
action_93 (47) = happyShift action_87
action_93 (14) = happyGoto action_79
action_93 _ = happyReduce_35

action_94 (47) = happyShift action_101
action_94 _ = happyFail

action_95 (45) = happyShift action_100
action_95 _ = happyFail

action_96 (50) = happyShift action_99
action_96 _ = happyFail

action_97 (50) = happyShift action_98
action_97 _ = happyFail

action_98 _ = happyReduce_2

action_99 (18) = happyShift action_22
action_99 (8) = happyGoto action_117
action_99 _ = happyReduce_8

action_100 (46) = happyShift action_116
action_100 _ = happyFail

action_101 (21) = happyShift action_65
action_101 (28) = happyShift action_66
action_101 (33) = happyShift action_67
action_101 (34) = happyShift action_68
action_101 (35) = happyShift action_69
action_101 (45) = happyShift action_70
action_101 (53) = happyShift action_71
action_101 (55) = happyShift action_72
action_101 (13) = happyGoto action_115
action_101 _ = happyFail

action_102 _ = happyReduce_36

action_103 (24) = happyShift action_114
action_103 _ = happyFail

action_104 _ = happyReduce_18

action_105 _ = happyReduce_19

action_106 (21) = happyShift action_65
action_106 (28) = happyShift action_66
action_106 (33) = happyShift action_67
action_106 (34) = happyShift action_68
action_106 (35) = happyShift action_69
action_106 (45) = happyShift action_70
action_106 (53) = happyShift action_71
action_106 (55) = happyShift action_72
action_106 (13) = happyGoto action_113
action_106 _ = happyFail

action_107 (36) = happyShift action_80
action_107 (37) = happyShift action_81
action_107 (38) = happyShift action_82
action_107 (39) = happyShift action_83
action_107 (40) = happyShift action_84
action_107 (43) = happyShift action_85
action_107 (47) = happyShift action_87
action_107 (48) = happyShift action_112
action_107 (14) = happyGoto action_79
action_107 _ = happyFail

action_108 _ = happyReduce_26

action_109 (45) = happyShift action_111
action_109 _ = happyFail

action_110 (36) = happyShift action_80
action_110 (37) = happyShift action_81
action_110 (38) = happyShift action_82
action_110 (39) = happyShift action_83
action_110 (40) = happyShift action_84
action_110 (43) = happyShift action_85
action_110 (47) = happyShift action_87
action_110 (14) = happyGoto action_79
action_110 _ = happyReduce_24

action_111 (21) = happyShift action_65
action_111 (28) = happyShift action_66
action_111 (33) = happyShift action_67
action_111 (34) = happyShift action_68
action_111 (35) = happyShift action_69
action_111 (45) = happyShift action_70
action_111 (53) = happyShift action_71
action_111 (55) = happyShift action_72
action_111 (13) = happyGoto action_121
action_111 (15) = happyGoto action_122
action_111 _ = happyFail

action_112 _ = happyReduce_25

action_113 (36) = happyShift action_80
action_113 (37) = happyShift action_81
action_113 (38) = happyShift action_82
action_113 (39) = happyShift action_83
action_113 (40) = happyShift action_84
action_113 (43) = happyShift action_85
action_113 (44) = happyShift action_120
action_113 (47) = happyShift action_87
action_113 (14) = happyGoto action_79
action_113 _ = happyFail

action_114 (23) = happyShift action_49
action_114 (25) = happyShift action_50
action_114 (26) = happyShift action_51
action_114 (49) = happyShift action_52
action_114 (53) = happyShift action_53
action_114 (11) = happyGoto action_119
action_114 _ = happyFail

action_115 (36) = happyShift action_80
action_115 (37) = happyShift action_81
action_115 (38) = happyShift action_82
action_115 (39) = happyShift action_83
action_115 (40) = happyShift action_84
action_115 (43) = happyShift action_85
action_115 (47) = happyShift action_87
action_115 (48) = happyShift action_118
action_115 (14) = happyGoto action_79
action_115 _ = happyFail

action_116 _ = happyReduce_34

action_117 _ = happyReduce_7

action_118 _ = happyReduce_33

action_119 _ = happyReduce_17

action_120 _ = happyReduce_21

action_121 (36) = happyShift action_80
action_121 (37) = happyShift action_81
action_121 (38) = happyShift action_82
action_121 (39) = happyShift action_83
action_121 (40) = happyShift action_84
action_121 (42) = happyShift action_125
action_121 (43) = happyShift action_85
action_121 (47) = happyShift action_87
action_121 (14) = happyGoto action_79
action_121 (16) = happyGoto action_124
action_121 _ = happyReduce_44

action_122 (46) = happyShift action_123
action_122 _ = happyFail

action_123 _ = happyReduce_27

action_124 _ = happyReduce_42

action_125 (21) = happyShift action_65
action_125 (28) = happyShift action_66
action_125 (33) = happyShift action_67
action_125 (34) = happyShift action_68
action_125 (35) = happyShift action_69
action_125 (45) = happyShift action_70
action_125 (53) = happyShift action_71
action_125 (55) = happyShift action_72
action_125 (13) = happyGoto action_126
action_125 _ = happyFail

action_126 (36) = happyShift action_80
action_126 (37) = happyShift action_81
action_126 (38) = happyShift action_82
action_126 (39) = happyShift action_83
action_126 (40) = happyShift action_84
action_126 (42) = happyShift action_125
action_126 (43) = happyShift action_85
action_126 (47) = happyShift action_87
action_126 (14) = happyGoto action_79
action_126 (16) = happyGoto action_127
action_126 _ = happyReduce_44

action_127 _ = happyReduce_43

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_2
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
		 (Class happy_var_2 [{- empty -}] [MainMethod [Variable TypeString happy_var_12] happy_var_15 happy_var_16]
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
		 (Class happy_var_2 happy_var_4 happy_var_5 : happy_var_7
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Variable happy_var_1 happy_var_2 : happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_0  7 happyReduction_6
happyReduction_6  =  HappyAbsSyn7
		 ([]
	)

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
		 (Method happy_var_2 happy_var_3 happy_var_5 happy_var_8 happy_var_9 happy_var_11 : happy_var_14
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_0  8 happyReduction_8
happyReduction_8  =  HappyAbsSyn8
		 ([]
	)

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Variable happy_var_1 happy_var_2 : happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  9 happyReduction_10
happyReduction_10 (HappyTerminal (TIdLiteral happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([Variable happy_var_1 happy_var_2]
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
happyReduction_15 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn10
		 (TypeAppDefined happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (StatementScope happy_var_2
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
		 (StatementIf happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5 11 happyReduction_18
happyReduction_18 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 11 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementAssignment happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 7 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementIndexedAssignment happy_var_1 happy_var_3 happy_var_6
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
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (ExprOp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 13 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (ExprList happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 _
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (ExprLength happy_var_1
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 6 13 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (ExprInvocation happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyTerminal (TIntLiteral  happy_var_1))
	 =  HappyAbsSyn13
		 (ExprInt happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn13
		 (ExprTrue
	)

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn13
		 (ExprFalse
	)

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn13
		 (ExprIdentifier happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn13
		 (ExprThis
	)

happyReduce_33 = happyReduce 5 13 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (ExprIntArray happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 13 happyReduction_34
happyReduction_34 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (ExprNewObject happy_var_2
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_2  13 happyReduction_35
happyReduction_35 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (ExprNegation happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  13 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn14
		 (OperandLogicalAnd
	)

happyReduce_38 = happySpecReduce_1  14 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn14
		 (OperandLess
	)

happyReduce_39 = happySpecReduce_1  14 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn14
		 (OperandPlus
	)

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (OperandMinus
	)

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn14
		 (OperandMult
	)

happyReduce_42 = happySpecReduce_2  15 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  16 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  16 happyReduction_44
happyReduction_44  =  HappyAbsSyn16
		 ([]
	)

happyNewToken action sts stk [] =
	action 56 56 notHappyAtAll (HappyState action) sts stk []

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
	TSingleLineComment -> cont 51;
	TMultiLineComment -> cont 52;
	TIdLiteral happy_dollar_dollar -> cont 53;
	TLongLiteral happy_dollar_dollar -> cont 54;
	TIntLiteral  happy_dollar_dollar -> cont 55;
	_ -> happyError' (tk:tks)
	}

happyError_ 56 tk tks = happyError' tks
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


parserError :: [Token] -> a
parserError tokens = error $ "Parse error, left over: " ++ concatMap show tokens
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
