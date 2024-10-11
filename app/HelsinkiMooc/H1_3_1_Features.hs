module HelsinkiMooc.H1_3_1_Features where

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
