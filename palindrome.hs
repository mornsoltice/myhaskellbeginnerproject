import Data.Char (toLower)

isPalindrome :: String -> Bool
isPalindrome s = cleaned == reverse cleaned
  where cleaned = map toLower $ filter (/= ' ') s

main :: IO ()
main = do
  putStrLn "Palindrome Checker"
  input <- getLine
  if isPalindrome input
    then putStrLn "String ini palindrom"
    else putStrLn "String ini bukan palindrom"
