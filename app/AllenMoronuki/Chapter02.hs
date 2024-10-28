module AllenMoronuki.Chapter02 where

ln :: Show a => a -> String
ln e = show e ++ "\n"

-- IO
c2 :: IO ()
c2 = do
  putStrLn "Chapter 2"
  -- putStrLn c2_5
  -- putStrLn c2_6
  -- putStrLn c2_7
  -- putStrLn c2_8
  -- putStrLn c2_9
  -- putStrLn c2_10
  putStrLn c2_11

circleArea :: Double -> Double
circleArea r = pi * (r * r)

-- 2.5 Evaluation

c2_5 :: String
c2_5 = ln "2.5"
  ++ ln (circleArea 2.0)

-- 2.6 Infix operators

perimeterA :: Int -> Int -> Int
perimeterA x y = (x * 2) + (y * 2)

perimeterB :: Int -> Int -> Int
perimeterB x y = x * 2 + y * 2

fA :: Float -> Float
fA x = x / 2 + 9

fB :: Float -> Float
fB x = x / (2 + 9)

c2_6 :: String
c2_6 = ln "2.6"
  ++ ln (((8 + 7 * 9) :: Int) /= ((8 + 7) * 9)) -- True
  ++ ln (perimeterA 5 8 == perimeterB 5 8) -- True
  ++ ln (fA 3 /= fB 3) -- True

-- 2.7 Declaring values

area :: Float -> Float
area x = 3.14 * (x * x) -- 3.14, not 3. 14

double :: Float -> Float
double x = x * 2 -- x, not b

xa :: Int
xa = 7

ya :: Int
ya = 10

f :: Int
f = xa + ya

c2_7 :: String
c2_7 = ln "2.7"
  ++ ln (area 3) -- 28.26
  ++ ln (double 2) -- 4
  ++ ln f -- 17

-- 2.8 Arithmetic functions in Haskell

c2_8 :: String
c2_8 = ln "2.8"
  ++ " div  3 2       = " ++ ln (div  3 2 :: Int  ) -- 1    round down
  ++ " quot 1 2       = " ++ ln (quot 1 2 :: Int  ) -- 0    round towards zero
  ++ " rem  9 3       = " ++ ln (rem  9 3 :: Int  ) -- 0    remainder after division
  ++ " mod  1 2       = " ++ ln (mod  1 2 :: Int  ) -- 1    remainder after modular division
  ++ " mod  3 2       = " ++ ln (mod  3 2 :: Int  ) -- 0
  ++ "      3/2       = " ++ ln (     3/2 :: Float) -- 1.5  fractional division
  ++ " 1 - 1 * 2 + 2  = " ++ ln ( 1-1*2+2 :: Int  ) -- 1    other arithmetic operators

-- 2.9 Parenthesization

prefixInfix :: Int -> Int -> Int
prefixInfix x y = (+) x y

sectionedInfix :: Int -> (Int -> Int)
sectionedInfix x = (+) x

sectionedNonCommutative :: Int -> (Int -> Int)
sectionedNonCommutative x = (x -)

sectionedLeftNonCommutative :: Int -> (Int -> Int)
sectionedLeftNonCommutative x = subtract x

c2_9 :: String
c2_9 = ln "2.9"
  ++ ln (prefixInfix 2 2 == 4)
  ++ ln (sectionedInfix 2 2 == prefixInfix 2 2)
  ++ ln (sectionedNonCommutative 3 1 == 2)
  ++ ln (sectionedLeftNonCommutative 3 1 == -2)

-- 2.10 Let and where

doubleWithWhere :: Int -> Int
doubleWithWhere n = doubleN
           where doubleN = n * 2

doubleWithLet :: Int -> Int
doubleWithLet n = let doubleN = n * 2
            in doubleN

c2_10_let_ex1 :: Int -> Int
c2_10_let_ex1 n = let x = n in x

c2_10_let_ex2 :: Int -> Int
c2_10_let_ex2 n = let x = n in x * x

c2_10_let_ex3 :: Int -> Int -> Int
c2_10_let_ex3 n m = let x = n; y = m in x * y

-- c2_10_let_ex4 :: Int -> Int -> Int
-- c2_10_let_ex4 n m = let x = n; y = m in x + 3

c2_10_where_ex1 :: Int -> Int
c2_10_where_ex1 n = x * 3 + y
                where x = n
                      y = 1000

c2_10_where_ex2 :: Int -> Int
c2_10_where_ex2 n = x * 5
                where x = n * 5 + y
                      y = 10 :: Int

c2_10_where_ex3 :: Double -> Double
c2_10_where_ex3 n = z / x + y
                where x = n
                      y = negate x
                      z = y * 10

c2_10 :: String
c2_10 = ln "2.10"
  ++ ln (doubleWithWhere 2) -- 4
  ++ ln (doubleWithLet 4) -- 8
  ++ ln (c2_10_let_ex1 5 == 5) -- True
  ++ ln (c2_10_let_ex2 5 == 25) -- True
  ++ ln (c2_10_let_ex3 5 6 == 30) -- True
  -- ++ ln (c2_10_let_ex4 3 1000 == 6) -- True
  ++ ln (c2_10_where_ex1 3 == 1009) -- True
  ++ ln (c2_10_where_ex2 10 == 300) -- True
  ++ ln (c2_10_where_ex3 7 == -17) -- True

-- 2_11 Chapter Exercises

intCompare :: Int -> Int -> Bool
intCompare n m = n == m

intPower :: Int -> Int -> Int
intPower = (^)

c2_11_brackets_e1 :: Bool
c2_11_brackets_e1 = intCompare (2 + 2 * 3 - 1) (2 + (2 * 3) - 1)

c2_11_brackets_e2 :: Bool
c2_11_brackets_e2 = intCompare (intPower 10 $ 1 + 1) (intPower 10 (1 + 1))

c2_11_brackets_e3 :: Bool
c2_11_brackets_e3 = intCompare (2 ^ 2 * 4 ^ 5 + 1) (((2 ^ 2) * (4 ^ 5)) + 1)

c2_11 :: String
c2_11 = ln "2.11 "
  ++ ln c2_11_brackets_e1
  ++ ln c2_11_brackets_e2
  ++ ln c2_11_brackets_e3
