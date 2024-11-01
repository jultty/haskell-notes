module Main where
import HelsinkiMooc.H1
import HelsinkiMooc.H2
import Spare.SystemIO (main)
import Spare.TenMinutes (main)
import AllenMoronuki.Chapter02
import AllenMoronuki.Chapter03
import AllenMoronuki.Chapter04

main :: IO ()
main = do
  c4

cold :: IO ()
cold = do
  Spare.TenMinutes.main
  Spare.SystemIO.main
  h1_3_1
  h1_5
  h1_6
  h1_7
  h1_8
  h1_9
  h2_1
  h2_2
  c2
  c3
