{-# LANGUAGE TypeApplications #-}

module Spare.TypeDefaults where

(#^) :: Int -> Int -> Int
(#^) = (^)

customOperatorDemo :: Bool
customOperatorDemo = (2 #^ 2 * 4 #^ 5 + 1) == (((2 #^ 2) * (4 #^ 5)) + 1)

typeApplicationDemo :: Bool
typeApplicationDemo = (^) @Int @Int 4 2 == 4 ^ 2

  -- refs
  -- https://devtut.github.io/haskell/type-application.html
  -- https://downloads.haskell.org/~ghc/9.0.1/docs/html/users_guide/exts/type_applications.html
