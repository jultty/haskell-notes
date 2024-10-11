module Spare.SystemIO where

import System.Process (readProcess)

main :: IO ()
main = do
  file_contents <- readFile "/etc/rc.conf"
  output <- lines <$> readProcess "bat" ["--color", "always", "-n"] file_contents
  mapM_ putStrLn output
  writeFile "/tmp/haskell-notes_Spare.SystemIO.temp" file_contents

  -- refs
  -- https://rosettacode.org/wiki/File_input/output#Haskell
  -- https://rosettacode.org/wiki/Get_system_command_output#Haskell
  -- https://learnyouahaskell.com/input-and-output
  -- https://hackage.haskell.org/package/process-1.6.24.0/docs/System-Process.html#v:readProcess
  -- https://hackage.haskell.org/package/base-4.20.0.1/docs/Prelude.html#v:lines
  -- https://hackage.haskell.org/package/base-4.20.0.1/docs/Prelude.html#v:-60--36--62-
