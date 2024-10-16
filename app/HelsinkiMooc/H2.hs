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

h2_1 :: IO ()
h2_1 = do
  putStrLn $ repeatString 3 "one " -- "one one one "
  print $ fibonacci 5 -- 5
