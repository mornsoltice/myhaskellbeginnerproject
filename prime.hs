isPrime :: Int -> Bool
isPrime n
  | n <= 1    = False
  | otherwise = null [ x | x <- [2..sqrtN], n `mod` x == 0 ]
  where
    sqrtN = floor . sqrt $ fromIntegral n

primesUpTo :: Int -> [Int]
primesUpTo n = filter isPrime [2..n]

main :: IO ()
main = do 
  putStrLn "Masukkan Bilangan Prima:"
  input <- getLine
  let limit = read input :: Int 
  putStrLn "Prima: "
  print (primesUpTo limit)
