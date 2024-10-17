module HelsinkiMooc.H2 where

-- Haskell MOOC Part 1, Lecture 2
-- by Joel Kaasinen (Nitor) and John Lång (University of Helsinki)
-- https://haskell.mooc.fi/part2

-- * means "not from the course content"

-- 2.1 Recursion and Helper Functions
-- https://haskell.mooc.fi/part1#recursion-and-helper-functions

--              (Eq t, num t) => t -> String -> String
repeatString :: Int -> String -> String
repeatString n str = repeatString' n str ""

--              (Eq t, Num t) => t -> [a] -> [a] -> [a]
repeatString' :: Int -> String -> String -> String
repeatString' n str result = if n == 0 then result
                            else repeatString' (n-1) str (result ++ str)

-- repeatString 3 "one "
-- repeatString' 3 "one " ""
-- repeatString' 2 "one " "one "
-- repeatString' 1 "one " "one one "
-- repeatString' 0 "one " "one one one "
-- "one one one "

fibonacci :: Integer -> Integer
-- Eta: f   = fibonacci' 0 1
-- fibonacci n = fibonacci' 0 1 n
fibonacci = fibonacci' 0 1

fibonacci' :: Integer -> Integer -> Integer -> Integer
-- fibonacci' a b 1 = b -- unused: a
fibonacci' _ b 1 = b
fibonacci' a b n = fibonacci' b (a+b) (n-1)

-- fibonacci 5
-- ( f' 0 1 5 )
--   ( f' 1 1 4 )
--     ( f' 1 2 3 )
--       ( f' 2 3 2 )
--         ( f' 3 5 1 )
--           5
-- 1  2  3  4  5 (c, reversed)
-- 0  1, 1, 2, 3 (a)
-- 1, 1, 2, 3, 5 (b)

h2_1 :: IO ()
h2_1 = do
  putStrLn $ repeatString 3 "one " -- "one one one "
  print $ fibonacci 5 -- 5
  print $ fibonacci 8 -- 21

-- 2.2 Guards
-- https://haskell.mooc.fi/part1#guards

describe :: Int -> String
describe n
  | n == 2      = "Two"
  | even n      = "Even"
  | n == 3      = "Three"
  | n > 100     = "Big!"
  | otherwise   = "The number " ++ show n

gfactorial :: Int -> Int
gfactorial n
  | n < 0     = -1
  | n == 0    = 1
  | otherwise = n * gfactorial (n-1)

-- Sometimes guards can replace pattern matching,
-- and they can also be combined:
guessAge :: String -> Int -> String
guessAge "Griselda" age
  | age < 47  = "Too low!"
  | age > 47  = "Too high!"
  | otherwise = "Correct!"
guessAge "Hansel" age
  | age < 12  = "Too low!"
  | age > 12  = "Too high!"
  | otherwise = "Correct!"
guessAge _ _ = "Wrong name!"

h2_2 :: IO ()
h2_2 = do
  print $ describe 38 -- "Even"
  print $ gfactorial 5 -- 120
  print $ guessAge "Griselda" 33
  print $ guessAge "Hansel" 20
  print $ guessAge "Hansel" 12

-- 2.3 Lists
-- https://haskell.mooc.fi/part1#lists

h2_3 :: IO ()
h2_3 = do
  print "Hello, 2.3"
