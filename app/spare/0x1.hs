fac 0 = 1
fac n = n * fac (n-1)

secsToWeeks secs = let perMinute = 60
                       perHour   = 60 * perMinute
                       perDay    = 24 * perHour
                       perWeek   =  7 * perDay
                   in  secs / perWeek

classify age = case age of 0 -> "newborn"
                           1 -> "infant"
                           2 -> "toddler"
                           _ -> "senior citizen"

main :: IO ()
main = do putStrLn "Name?"
          print ("Hello" ++ ('H' : ['a', 's', 'k', 'e', 'l', 'l']))
          print (fac 42)
          print (fac 0)
          let list = [1 .. 5]
          print list
          print(map (+ 2) list)
          print(filter (> 2) list)
          print (fst (1, 2))
          print (snd (1, 2))
          print (map fst [(1,2), (3,4), (5,6)])
          print "Hello, ...?"
          name <- getLine
          print ("Hello, " ++ name ++ ". How old are you?")
          age <- readLn
          print ("Hello, " ++ name ++ ", the " ++ classify age)

--- refs:
-- https://wiki.haskell.org/Haskell_in_5_steps
-- https://wiki.haskell.org/Learn_Haskell_in_10_minutes
-- https://learnyouahaskell.com/input-and-output
