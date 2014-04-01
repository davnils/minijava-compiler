{-# LANGUAGE CPP #-}
{-# LINE 1 "Lexer.x" #-}

module Lexer where

import Data.Char (isAlpha)
import System.IO.Unsafe


#if __GLASGOW_HASKELL__ >= 603
#include "ghcconfig.h"
#elif defined(__GLASGOW_HASKELL__)
#include "config.h"
#endif
#if __GLASGOW_HASKELL__ >= 503
import Data.Array
import Data.Char (ord)
import Data.Array.Base (unsafeAt)
#else
import Array
import Char (ord)
#endif
{-# LINE 1 "templates/wrappers.hs" #-}
{-# LINE 1 "templates/wrappers.hs" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/wrappers.hs" #-}
-- -----------------------------------------------------------------------------
-- Alex wrapper code.
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

import Data.Word (Word8)
{-# LINE 22 "templates/wrappers.hs" #-}

import qualified Data.Bits

-- | Encode a Haskell String to a list of Word8 values, in UTF8 format.
utf8Encode :: Char -> [Word8]
utf8Encode = map fromIntegral . go . ord
 where
  go oc
   | oc <= 0x7f       = [oc]

   | oc <= 0x7ff      = [ 0xc0 + (oc `Data.Bits.shiftR` 6)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]

   | oc <= 0xffff     = [ 0xe0 + (oc `Data.Bits.shiftR` 12)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
   | otherwise        = [ 0xf0 + (oc `Data.Bits.shiftR` 18)
                        , 0x80 + ((oc `Data.Bits.shiftR` 12) Data.Bits..&. 0x3f)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]



type Byte = Word8

-- -----------------------------------------------------------------------------
-- The input type


type AlexInput = (AlexPosn,     -- current position,
                  Char,         -- previous char
                  [Byte],       -- pending bytes on current char
                  String)       -- current input string

ignorePendingBytes :: AlexInput -> AlexInput
ignorePendingBytes (p,c,ps,s) = (p,c,[],s)

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (p,c,bs,s) = c

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p,c,(b:bs),s) = Just (b,(p,c,bs,s))
alexGetByte (p,c,[],[]) = Nothing
alexGetByte (p,_,[],(c:s))  = let p' = alexMove p c 
                                  (b:bs) = utf8Encode c
                              in p' `seq`  Just (b, (p', c, bs, s))


{-# LINE 89 "templates/wrappers.hs" #-}

{-# LINE 103 "templates/wrappers.hs" #-}

{-# LINE 118 "templates/wrappers.hs" #-}

-- -----------------------------------------------------------------------------
-- Token positions

-- `Posn' records the location of a token in the input text.  It has three
-- fields: the address (number of chacaters preceding the token), line number
-- and column of a token within the file. `start_pos' gives the position of the
-- start of the file and `eof_pos' a standard encoding for the end of file.
-- `move_pos' calculates the new position after traversing a given character,
-- assuming the usual eight character tab stops.


data AlexPosn = AlexPn !Int !Int !Int
        deriving (Eq,Show)

alexStartPos :: AlexPosn
alexStartPos = AlexPn 0 1 1

alexMove :: AlexPosn -> Char -> AlexPosn
alexMove (AlexPn a l c) '\t' = AlexPn (a+1)  l     (((c+7) `div` 8)*8+1)
alexMove (AlexPn a l c) '\n' = AlexPn (a+1) (l+1)   1
alexMove (AlexPn a l c) _    = AlexPn (a+1)  l     (c+1)


-- -----------------------------------------------------------------------------
-- Default monad

{-# LINE 231 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Monad (with ByteString input)

{-# LINE 320 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Basic wrapper

{-# LINE 347 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Basic wrapper, ByteString version

{-# LINE 365 "templates/wrappers.hs" #-}

{-# LINE 378 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Posn wrapper

-- Adds text positions to the basic model.


--alexScanTokens :: String -> [token]
alexScanTokens str = go (alexStartPos,'\n',[],str)
  where go inp@(pos,_,_,str) =
          case alexScan inp 0 of
                AlexEOF -> []
                AlexError ((AlexPn _ line column),_,_,_) -> error $ "lexical error at " ++ (show line) ++ " line, " ++ (show column) ++ " column"
                AlexSkip  inp' len     -> go inp'
                AlexToken inp' len act -> act pos (take len str) : go inp'



-- -----------------------------------------------------------------------------
-- Posn wrapper, ByteString version

{-# LINE 410 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- GScan wrapper

-- For compatibility with previous versions of Alex, and because we can.

alex_base :: Array Int Int
alex_base = listArray (0,141) [-8,-36,8,136,264,392,-98,520,-109,-102,-106,-34,-99,-100,0,633,0,698,-95,954,890,0,0,1003,-97,1217,0,1069,-92,1473,1409,0,-21,-90,1656,1624,1699,1774,1849,1924,1999,2074,2149,2224,0,2299,2374,2449,2524,2599,2674,2749,2824,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2830,3044,3039,3252,3327,3402,3477,3552,3627,3702,3777,3852,3927,4002,4077,4152,4227,4302,4377,4452,4527,4602,4677,4752,4827,4902,4977,5052,5127,5202,5277,5352,5427,5502,5577,5652,5727,5802,5877,5952,6027,6102,6177,6254,6329,6404,6479,6554,6629,6704,6779,6854,6929,7004,7079,7154,7229,7304,7379,7454,7529,7604,7679,7754,7829,7904,7979,8054,8129,0,0,-54,8204]

alex_table :: Array Int Int
alex_table = listArray (0,8459) $ unsafePerformIO (readFile "lexer_table" >>= return . read)

alex_check :: Array Int Int
alex_check = listArray (0,8459) $ unsafePerformIO (readFile "lexer_check_table" >>= return . read)

alex_deflt :: Array Int Int
alex_deflt = listArray (0,141) [-1,-1,25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,16,16,21,21,-1,25,25,25,26,26,-1,25,31,31,-1,69,69,69,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,69,25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]

alex_accept = listArray (0::Int,141) [AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccNone,AlexAccSkip,AlexAcc (alex_action_1),AlexAcc (alex_action_2),AlexAcc (alex_action_3),AlexAcc (alex_action_4),AlexAcc (alex_action_5),AlexAcc (alex_action_6),AlexAcc (alex_action_7),AlexAcc (alex_action_8),AlexAcc (alex_action_9),AlexAcc (alex_action_10),AlexAcc (alex_action_11),AlexAcc (alex_action_12),AlexAcc (alex_action_13),AlexAcc (alex_action_14),AlexAcc (alex_action_15),AlexAcc (alex_action_16),AlexAcc (alex_action_17),AlexAcc (alex_action_18),AlexAcc (alex_action_19),AlexAcc (alex_action_20),AlexAcc (alex_action_21),AlexAcc (alex_action_22),AlexAcc (alex_action_23),AlexAcc (alex_action_24),AlexAcc (alex_action_25),AlexAcc (alex_action_26),AlexAcc (alex_action_27),AlexAcc (alex_action_28),AlexAcc (alex_action_29),AlexAcc (alex_action_30),AlexAcc (alex_action_31),AlexAcc (alex_action_32),AlexAcc (alex_action_33),AlexAcc (alex_action_34),AlexAcc (alex_action_35),AlexAcc (alex_action_36),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_37),AlexAcc (alex_action_38),AlexAcc (alex_action_39),AlexAcc (alex_action_40),AlexAcc (alex_action_41)]
{-# LINE 62 "Lexer.x" #-}


data Token
 = TClass
 | TPublic
 | TStatic
 | TMain
 | TNew
 | TReturn
 | TIf
 | TElse
 | TWhile
 | TPrint
 | TLength
 | TThis

 | TIdLiteral String
 | TIntLiteral Int
 | TLongLiteral Int

 | TVoid
 | TString
 | TInt
 | TBoolean
 | TTrue
 | TFalse

 | TNegation
 | TLogicAnd
 | TCompareLess
 | TAdd
 | TSub
 | TMul

 | TAssignment
 | TComma
 | TDot
 | TSemiColon
 | TLeftParen
 | TRightParen
 | TLeftBracket
 | TRightBracket
 | TLeftBrace
 | TRightBrace
 | TSingleLineComment
 | TMultiLineComment
 deriving (Eq, Ord, Show)

type SourceInfo = (Int, Int)

readLong :: (Num a, Read a) => String -> a
readLong = read . takeWhile (not . isAlpha)

tag :: (String -> Token) -> AlexPosn -> String -> (Token, SourceInfo)
tag f (AlexPn _ row col) input =  (f input, (row, col))

tag' :: Token -> AlexPosn -> String -> (Token, SourceInfo)
tag' res pos =  tag (const res) pos

{-main = do
  s <- getContents
  print $ alexScanTokens s-}

alex_action_1 = tag' TClass                    
alex_action_2 = tag' TPublic                   
alex_action_3 = tag' TStatic                   
alex_action_4 = tag' TMain                     
alex_action_5 = tag' TNew                      
alex_action_6 = tag' TReturn                   
alex_action_7 = tag' TIf                       
alex_action_8 = tag' TElse                     
alex_action_9 = tag' TWhile                    
alex_action_10 = tag' TPrint                    
alex_action_11 = tag' TLength                   
alex_action_12 = tag' TThis                     
alex_action_13 = tag' TVoid                     
alex_action_14 = tag' TString                   
alex_action_15 = tag' TInt                      
alex_action_16 = tag' TBoolean                  
alex_action_17 = tag' TTrue                     
alex_action_18 = tag' TFalse                    
alex_action_19 = tag' TNegation                 
alex_action_20 = tag' TLogicAnd                 
alex_action_21 = tag' TCompareLess              
alex_action_22 = tag' TAdd                      
alex_action_23 = tag' TSub                      
alex_action_24 = tag' TMul                      
alex_action_25 = tag' TAssignment               
alex_action_26 = tag' TComma                    
alex_action_27 = tag' TDot                      
alex_action_28 = tag' TSemiColon                
alex_action_29 = tag' TLeftParen                
alex_action_30 = tag' TRightParen               
alex_action_31 = tag' TLeftBracket              
alex_action_32 = tag' TRightBracket             
alex_action_33 = tag' TLeftBrace                
alex_action_34 = tag' TRightBrace               
alex_action_35 = tag' TSingleLineComment        
alex_action_36 = tag' TMultiLineComment         
alex_action_37 = tag $ TIdLiteral               
alex_action_38 = tag $ TLongLiteral . readLong  
alex_action_39 = tag $ TLongLiteral . readLong  
alex_action_40 = tag $ TIntLiteral  . read      
alex_action_41 = tag $ TIntLiteral  . read      
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- -----------------------------------------------------------------------------
-- ALEX TEMPLATE
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

-- -----------------------------------------------------------------------------
-- INTERNALS and main scanner engine

{-# LINE 35 "templates/GenericTemplate.hs" #-}

{-# LINE 45 "templates/GenericTemplate.hs" #-}

{-# LINE 66 "templates/GenericTemplate.hs" #-}
alexIndexInt16OffAddr arr off = arr ! off


{-# LINE 87 "templates/GenericTemplate.hs" #-}
alexIndexInt32OffAddr arr off = arr ! off


{-# LINE 98 "templates/GenericTemplate.hs" #-}
quickIndex arr i = arr ! i


-- -----------------------------------------------------------------------------
-- Main lexing routines

data AlexReturn a
  = AlexEOF
  | AlexError  !AlexInput
  | AlexSkip   !AlexInput !Int
  | AlexToken  !AlexInput !Int a

-- alexScan :: AlexInput -> StartCode -> AlexReturn a
alexScan input (sc)
  = alexScanUser undefined input (sc)

alexScanUser user input (sc)
  = case alex_scan_tkn user input (0) input sc AlexNone of
	(AlexNone, input') ->
		case alexGetByte input of
			Nothing -> 



				   AlexEOF
			Just _ ->



				   AlexError input'

	(AlexLastSkip input'' len, _) ->



		AlexSkip input'' len

	(AlexLastAcc k input''' len, _) ->



		AlexToken input''' len k


-- Push the input through the DFA, remembering the most recent accepting
-- state it encountered.

alex_scan_tkn user orig_input len input s last_acc =
  input `seq` -- strict in the input
  let 
	new_acc = (check_accs (alex_accept `quickIndex` (s)))
  in
  new_acc `seq`
  case alexGetByte input of
     Nothing -> (new_acc, input)
     Just (c, new_input) -> 



      case fromIntegral c of { (ord_c) ->
        let
                base   = alexIndexInt32OffAddr alex_base s
                offset = (base + ord_c)
                check  = alexIndexInt16OffAddr alex_check offset
		
                new_s = if (offset >= (0)) && (check == ord_c)
			  then alexIndexInt16OffAddr alex_table offset
			  else alexIndexInt16OffAddr alex_deflt s
	in
        case new_s of
	    (-1) -> (new_acc, input)
		-- on an error, we want to keep the input *before* the
		-- character that failed, not after.
    	    _ -> alex_scan_tkn user orig_input (if c < 0x80 || c >= 0xC0 then (len + (1)) else len)
                                                -- note that the length is increased ONLY if this is the 1st byte in a char encoding)
			new_input new_s new_acc
      }
  where
	check_accs (AlexAccNone) = last_acc
	check_accs (AlexAcc a  ) = AlexLastAcc a input (len)
	check_accs (AlexAccSkip) = AlexLastSkip  input (len)

	check_accs (AlexAccPred a predx rest)
	   | predx user orig_input (len) input
	   = AlexLastAcc a input (len)
	   | otherwise
	   = check_accs rest
	check_accs (AlexAccSkipPred predx rest)
	   | predx user orig_input (len) input
	   = AlexLastSkip input (len)
	   | otherwise
	   = check_accs rest


data AlexLastAcc a
  = AlexNone
  | AlexLastAcc a !AlexInput !Int
  | AlexLastSkip  !AlexInput !Int

instance Functor AlexLastAcc where
    fmap f AlexNone = AlexNone
    fmap f (AlexLastAcc x y z) = AlexLastAcc (f x) y z
    fmap f (AlexLastSkip x y) = AlexLastSkip x y

data AlexAcc a user
  = AlexAccNone
  | AlexAcc a
  | AlexAccSkip

  | AlexAccPred a   (AlexAccPred user) (AlexAcc a user)
  | AlexAccSkipPred (AlexAccPred user) (AlexAcc a user)

type AlexAccPred user = user -> AlexInput -> Int -> AlexInput -> Bool

-- -----------------------------------------------------------------------------
-- Predicates on a rule

alexAndPred p1 p2 user in1 len in2
  = p1 user in1 len in2 && p2 user in1 len in2

--alexPrevCharIsPred :: Char -> AlexAccPred _ 
alexPrevCharIs c _ input _ _ = c == alexInputPrevChar input

alexPrevCharMatches f _ input _ _ = f (alexInputPrevChar input)

--alexPrevCharIsOneOfPred :: Array Char Bool -> AlexAccPred _ 
alexPrevCharIsOneOf arr _ input _ _ = arr ! alexInputPrevChar input

--alexRightContext :: Int -> AlexAccPred _
alexRightContext (sc) user _ _ input = 
     case alex_scan_tkn user input (0) input sc AlexNone of
	  (AlexNone, _) -> False
	  _ -> True
	-- TODO: there's no need to find the longest
	-- match when checking the right context, just
	-- the first match will do.


-- used by wrappers
iUnbox (i) = i
