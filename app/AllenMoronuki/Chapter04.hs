module AllenMoronuki.Chapter04 where

import AllenMoronuki.Chapter02 (ln)
import Data.Tuple

-- IO
c4 :: IO ()
c4 = do
  putStrLn "Chapter 4: Basic datatypes"
  -- putStrLn c4_3
  -- putStrLn c4_4
  -- putStrLn c4_6
  -- putStrLn c4_7
  putStrLn c4_9

-- 4.3 Anatomy of a data declaration

data MyDataType = DataConstructorA | DataConstructorB deriving Show
--   '--.-----'
--      '--> type constructor

v1 :: MyDataType
v1 = DataConstructorA

v2 :: MyDataType
v2 = DataConstructorB

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

c4_3 :: String
c4_3 = ln "4.3 Anatomy of a data declaration"
  ++ ln v2
  ++ ln (changeMood Blah) -- Woot
  ++ ln (changeMood Woot) -- Blah

-- 4.4 Numeric types

r :: Rational
r = 13/8

c4_4 :: String
c4_4 = ln "4.4 Numeric types"
  ++ ln r

-- 4.6 Go on and Bool me

-- data Bool = False | True

c4_6 :: String
c4_6 = ln "4.6 Go on and Bool me"
  ++ ln (if (True || False) -- True
         then (True || False && True && True) -- True
         else (False && False && True || False)) -- False

-- 4.7 Tuples

-- two-tuple or pair
t2 :: (Int,Char)
t2 = (0,'s')

-- three-tuple or triple
t3 :: Int -> Int -> (Int,Int,Int)
t3 j k = (j,k,div j k)

c4_7 :: String
c4_7 = ln "4.7 Tuples"
  ++ ln t2 -- (0,'s')
  ++ ln (t3 3 2) -- (3,2,1)
  ++ ln (fst t2) -- 0
  ++ ln (snd t2) -- 's'
  ++ ln (swap t2) -- from Data.Tuple
  ++ ln (6 + fst t2) -- 6
  ++ ln ("Ha" ++ (snd t2 : "kell")) -- "Haskell"

-- 4.9 Lists

-- awesome :: [String] = ["Papuchon", "curry", ":)"]
-- also :: [String] = ["Quake", "The Simons"]
-- allAwesome :: [[String]] = [awesome, also]

awesome :: [String]
awesome = ["Papuchon", "curry", ":)"]

also :: [String]
also = ["Quake", "The Simons"]

allAwesome :: [[String]]
allAwesome = [awesome, also]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome s = s == reverse s

absolute :: Int -> Int
absolute n = if n < 0 then n * (-1) else n

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c,d) = ((b, d), (a, c))

x :: Int -> Int -> Int
x = (+)

g :: Foldable t => t a -> Int
g xs = w `x` 1
    where w = length xs

f2 :: (a, b) -> a
f2 t = fst t

c4_9 :: String
c4_9 = ln "4.9 Chapter Exercises"
  ++ ln ( length ([1, 2, 3, 4, 5] :: [Int]) == 5 )
  ++ ln ( length ([1, 2, 3, 4, 5] :: [Int]) == 5 )
  ++ ln ( length ([(1, 2), (2, 3), (3, 4)] :: [(Int, Int)]) == 3 )
  ++ ln ( length allAwesome == 2 )
  ++ ln ( length (concat allAwesome) == 5 )
  ++ ln ( div 6 (length ([1, 2, 3] :: [Int])) == 2 )
  -- ++ ln ( ((2 :: Int) + 3 == 5) == True )
  -- ++ ln ( ((5 :: Int) + 3 == 5) == False )
  -- ++ ln ( isPalindrome "139" == False )
  ++ ln ( isPalindrome "13131" )
  ++ ln ( absolute 13 == 13 )
  ++ ln ( absolute (-13) == 13 )
  ++ ln ( f (1, 2) ('a', 'b') == ((2, 'b'), (1, 'a')) )
  ++ ln ( g [1, 2, 3] == 4 )
  ++ ln ( f2 (1, 2) == 1 )
