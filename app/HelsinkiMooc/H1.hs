module HelsinkiMooc.H1 where

import Data.Typeable

-- 1.3.1 Features
-- https://haskell.mooc.fi/part1#features

h1_3_1 :: IO ()
h1_3_1 = do
  -- Higher-order functions
  print (map length ["123", "123456"]) -- [3,6]

  -- Lambdas
  print (filter (\x -> length x > 1) ["123", "1", "12"]) -- ["123", "12"]
  -- TODO How to escape things?
  -- TODO How to give more than one argument to lambdas?

  -- Partial application
  print (map (*3) [1, 2, 3]) -- [3,6,9]

  -- Algebraic datatypes
  -- data Shape = Point | Rectangle Double Double | Circle Double

  -- Pattern matching
  -- area Point = 0
  -- area (Rectangle width height) = width * height
  -- area (Circle radius) = 2 * pi * radius


-- 1.5 Let's Start!
-- https://haskell.mooc.fi/part1#lets-start

list :: [Int]
list = [1, 2, 3, 4, 5, 6 ]

h1_5 :: IO ()
h1_5 = do
  -- Data.Typeable.typeOf*
  print (typeOf list)

  -- $*
  -- Can be used to eliminate parenthesis
  print $ "hello" ++ "world"

  -- tail
  print $ tail list

  -- head
  print $ head list

  -- reverse
  print $ reverse list


-- * means "not from the course content"

-- 1.6 Expressions and Types
-- https://haskell.mooc.fi/part1#expressions-and-types

-- Typing a variable
x :: Int
x = 3

-- Typing a function
f :: Int -> Int -> Int
f a b = a + b

-- String is the same as [Char] (list of chars)
s1 :: String
s1 = "a String string"

s2 :: [Char]
s2 = "a [Char] string"


h1_6 :: IO ()
h1_6 = do
  print(f 2 x) -- 5
  print (typeOf s1 == typeOf s2) -- True
