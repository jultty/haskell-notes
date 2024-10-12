module HelsinkiMooc.H1 where

-- Haskell MOOC Part 1, Lecture 1
-- by Joel Kaasinen (Nitor) and John Lång (University of Helsinki)
-- https://haskell.mooc.fi/part1

-- * means "not from the course content"

-- 1.3.1 Features
-- https://haskell.mooc.fi/part1#features

import Data.Typeable
import qualified Data.Text as T
import qualified Data.Text.IO as T

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

-- 1.7 The Structure of a Haskell Program
-- https://haskell.mooc.fi/part1#the-structure-of-a-haskell-program

-- Each Haskell file is a module
-- A Name.hs modules' first line would be 'module Name where'

-- Unlike variables, functions have arguments to the left of the equation
g :: Double -> Double
g i = 1 / i

-- The operator for exponentiation is ^
powerOf :: Float -> Int -> Float
powerOf b e = b^e

h1_7 :: IO ()
h1_7 = do
  print $ g 0 -- Infinity
  print $ g 2 -- 0.5
  print $ powerOf 4 2 -- 16.0

-- 1.8 Dealing with Errors
-- https://haskell.mooc.fi/part1#the-structure-of-a-haskell-program

-- ++ is not so much a string concatenator as a list joiner
list2 = [ 4, 8, 16 ]
list3 = [ 32, 64, 128 ]

h1_8 :: IO ()
h1_8 = do
  print $ list2 ++ list3 -- [4,8,16,32,64,128]

  -- div is for integer division
  print $ div 7 2 -- 3

  -- with backticks, you can use it in between
  print $ 7 `div` 2 -- 3

  -- / is for float division
  print $ 7 / 2 -- 3.5

-- 1.9 How Do I Get Anything Done?
-- https://haskell.mooc.fi/part1#how-do-i-get-anything-done

-- Logical operators are the usual == > < <= >= || &&,
-- except for inequality (/=) and negation (not)
h :: Int -> String
h j = if not (j /= 2)
      then "Two"
      else "Not two"

-- -n can be returned directly instead of n * -1
absoluteValue :: Int -> Int
absoluteValue n = if n < 0 then -n else n

-- value and functions can be defined locally with let and where
circleArea :: Double -> Double
circleArea r = pi * square r
    where pi = 3.1415926
          square r = r * r

-- let...in is an expression
mkSquare :: Int -> Int
mkSquare i = let j = i; square k = k * k in square j

-- pattern matching is done by defining multiple equations
-- also, UTF-8 strings with the Text package*
greet :: String -> String -> T.Text
pack s1 s2 = T.pack $ s1 ++ s2
greet "PT" name = pack "Olá, "    name
greet "EN" name = pack "Hello, "  name
greet "ES" name = pack "Hola, "   name
greet  _   name = pack "👋 "     name

-- or, with case expressions*
greet2 :: String -> String -> T.Text
greet2 language name = case language of
  "PT"     -> pack "Olá, "
  "EN"     -> pack "Hello, "
  "日本語" -> pack "どうも"
  "ES"     -> pack "Hola, "
  _        -> pack "👋 "
  where pack language = T.pack $ language ++ name

-- pattern matching can use the default value too
-- also demonstrates 'show' for casting to string
describe :: Integer -> String
describe n = case n of
  0 -> "zero"
  1 -> "one"
  2 -> "an even prime"
  n -> "the number " ++ show n

-- recursion

-- factorial is the product of the first n positive integers
factorial :: Int -> Int
factorial 1 = 1
factorial n = n * factorial (n-1)

-- factorial 3
-- ==> factorial 3 = 3 * factorial 2
-- ==> factorial 3 = 3 * (2 * factorial 1)
-- ==> factorial 3 = 3 * (2 * 1)
-- ==> factorial 3 = 3 * 2 = 6

-- for a double recursion example,
-- this (naive) implementation is presented:
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

-- fibonacci 5
--   ==> fibonacci 3                 + fibonacci 4
--   ==> (fibonacci 1 + fibonacci 2) + fibonacci 4
--   ==> (    1       +       1    ) + fibonacci 4
--   ==> (    1       +       1    ) + (fibonacci 2 + fibonacci 3)
--   ==> (    1       +       1    ) + (fibonacci 2 + (fibonacci 1 + fibonacci 2))
--   ==> (    1       +       1    ) + (    1       + (    1       +     1      ))
--   ==> 5

h1_9 :: IO ()
h1_9 = do
  -- if is an expression, not a statement
  -- therefore, else is obligatory
  print $ if 2 == 2 then "still spinning" else "uh-oh" -- "still spinning"
  print $ h 3  -- True
  print $ h 2 -- False
  print $ h 1 -- False
  print $ absoluteValue (-8) -- 8
  print $ circleArea 22 -- 1520.5308184
  print $ mkSquare 4 -- 16
  T.putStrLn $ greet "PT" "Maria" -- Olá, Maria
  T.putStrLn $ greet "FL" "Marika" -- 👋 Marika
  T.putStrLn $ greet2 "PT" "Espertirina" -- Olá, Espertirina
  T.putStrLn $ greet2 "ES" "Carolina" -- Hola, Carolina
  T.putStrLn $ greet2 "日本語" "昭雄" --  どうも 昭雄
  T.putStrLn $ greet2 "ZU" "Yemi" -- 👋 Yemi
  print $ describe 9 -- "the number 9"
  print $ factorial 3 -- 6
  print $ fibonacci 6 -- 8

-- Extra references
-- https://www.haskell.org/tutorial/patterns.html
-- https://stackoverflow.com/a/60821959
