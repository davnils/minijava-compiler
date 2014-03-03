{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Lexer

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
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

action_0 (16) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (16) = happyShift action_2
action_1 _ = happyFail

action_2 (52) = happyShift action_4
action_2 _ = happyFail

action_3 (55) = happyAccept
action_3 _ = happyFail

action_4 (48) = happyShift action_5
action_4 _ = happyFail

action_5 (17) = happyShift action_6
action_5 _ = happyFail

action_6 (18) = happyShift action_7
action_6 _ = happyFail

action_7 (28) = happyShift action_8
action_7 _ = happyFail

action_8 (19) = happyShift action_9
action_8 _ = happyFail

action_9 (44) = happyShift action_10
action_9 _ = happyFail

action_10 (29) = happyShift action_11
action_10 _ = happyFail

action_11 (46) = happyShift action_12
action_11 _ = happyFail

action_12 (47) = happyShift action_13
action_12 _ = happyFail

action_13 (52) = happyShift action_14
action_13 _ = happyFail

action_14 (45) = happyShift action_15
action_14 _ = happyFail

action_15 (48) = happyShift action_16
action_15 _ = happyFail

action_16 (49) = happyShift action_17
action_16 _ = happyFail

action_17 (49) = happyShift action_18
action_17 _ = happyFail

action_18 _ = happyReduce_1

happyReduce_1 = happyReduce 16 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
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
	 = HappyAbsSyn4
		 (Class happy_var_2 [] [MainMethod [] [] []]
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 6 5 happyReduction_2
happyReduction_2 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_1
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  6 happyReduction_3
happyReduction_3 _
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 13 7 happyReduction_4
happyReduction_4 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (happy_var_1
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  8 happyReduction_5
happyReduction_5 _
	(HappyTerminal (TIdLiteral happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 happy_var_2
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  9 happyReduction_6
happyReduction_6 (HappyTerminal (TIdLiteral happy_var_3))
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  10 happyReduction_7
happyReduction_7 _
	_
	_
	 =  HappyAbsSyn10
		 (TypeIntegerArray
	)

happyReduce_8 = happySpecReduce_1  10 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn10
		 (TypeBoolean
	)

happyReduce_9 = happySpecReduce_1  10 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn10
		 (TypeInteger
	)

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 7 11 happyReduction_11
happyReduction_11 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementIf happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 11 happyReduction_12
happyReduction_12 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 11 happyReduction_13
happyReduction_13 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 11 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementAssignment happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 7 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (StatementIndexedAssignment happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  12 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (ExprOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 12 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (ExprList happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 _
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (ExprLength happy_var_1
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happyReduce 6 12 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (ExprInvocation happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyTerminal (TIntLiteral  happy_var_1))
	 =  HappyAbsSyn12
		 (ExprInt happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn12
		 (ExprTrue
	)

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn12
		 (ExprFalse
	)

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 (HappyTerminal (TIdLiteral happy_var_1))
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (ExprThis
	)

happyReduce_25 = happyReduce 5 12 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (ExprIntArray happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 12 happyReduction_26
happyReduction_26 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdLiteral happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (ExprNewObject happy_var_2
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_2  12 happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (ExprNegation happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn13
		 (OperandLogicalAnd
	)

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn13
		 (OperandLess
	)

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn13
		 (OperandPlus
	)

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn13
		 (OperandMinus
	)

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn13
		 (OperandMult
	)

happyReduce_34 = happySpecReduce_2  14 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  15 happyReduction_35
happyReduction_35 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TClass -> cont 16;
	TPublic -> cont 17;
	TStatic -> cont 18;
	TMain -> cont 19;
	TNew -> cont 20;
	TReturn -> cont 21;
	TIf -> cont 22;
	TElse -> cont 23;
	TWhile -> cont 24;
	TPrint -> cont 25;
	TLength -> cont 26;
	TThis -> cont 27;
	TVoid -> cont 28;
	TString -> cont 29;
	TInt -> cont 30;
	TBoolean -> cont 31;
	TTrue -> cont 32;
	TFalse -> cont 33;
	TNegation -> cont 34;
	TLogicAnd -> cont 35;
	TCompareLess -> cont 36;
	TAdd -> cont 37;
	TSub -> cont 38;
	TMul -> cont 39;
	TAssignment -> cont 40;
	TComma -> cont 41;
	TDot -> cont 42;
	TSemiColon -> cont 43;
	TLeftParen -> cont 44;
	TRightParen -> cont 45;
	TLeftBracket -> cont 46;
	TRightBracket -> cont 47;
	TLeftBrace -> cont 48;
	TRightBrace -> cont 49;
	TSingleLineComment -> cont 50;
	TMultiLineComment -> cont 51;
	TIdLiteral happy_dollar_dollar -> cont 52;
	TLongLiteral happy_dollar_dollar -> cont 53;
	TIntLiteral  happy_dollar_dollar -> cont 54;
	_ -> happyError' (tk:tks)
	}

happyError_ 55 tk tks = happyError' tks
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
