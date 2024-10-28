module AllenMoronuki.Chapter03 where

import AllenMoronuki.Chapter02 (ln)

-- IO
c3 :: IO ()
c3 = do
  putStr "Chap"
  putStr "ter "
  putStr "3: "
  putStr "Strings\n"
  putStrLn c3_5
  c3_6
  putStrLn c3_7

-- 3.5 Types of concatenation functions

listOfInts :: [[Int]]
listOfInts = [[0,2], [4,16], [32,64]]

c3_5 :: String
c3_5 = ln "3.5 Types of concatenation functions"
  ++ ln (concat listOfInts)

-- 3.6 Concatenation and scoping

greeting :: String
greeting = "Yarrrrr"

printSecond :: IO ()
printSecond = do
  putStrLn greeting

c3_6 :: IO ()
c3_6 = do
  putStrLn "3.6 Concatenation and scoping"
  putStrLn greeting
  printSecond

-- 3.7 More list functions

-- e : l adds element e to the beginning of list l
-- i.e., it returns a new list with e prepended to l
list :: [Int]
list = 0 : [1, 2, 3]

c3_7 :: String
c3_7 = ln "3.7 More list functions"
  ++ ln list
  ++ ln (head list) -- head returns the first element
  ++ ln (tail list) -- tail returns the list without its head
  ++ ln (take 2 list) -- take n returns the n first elements of the list
  ++ ln (drop 2 list) -- drop n returns the list after dropping the n first elements
  ++ ln (list !! 2) -- l !! n returns the 0-indexed nth element of list l

