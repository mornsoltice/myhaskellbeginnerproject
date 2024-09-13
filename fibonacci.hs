fibonacci :: Int -> [Int]
fibonacci n = takeWhile (<= n) fibs
  where
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = do
  putStrLn "Enter the maximum value for the Fibonacci sequence:"
  input <- getLine
  let limit = read input :: Int
  putStrLn "Fibonacci sequence:"
  print (fibonacci limit)
