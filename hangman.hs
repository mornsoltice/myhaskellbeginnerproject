import System.IO (hSetBuffering, stdin, BufferMode(NoBuffering))
import Data.Char (toLower)

gameWon :: String -> String -> Bool
gameWon word guessed = all (`elem` guessed) word

showWord :: String -> String -> String
showWord word guessed = [if c `elem` guessed then c else '_' | c <- word]

playGame :: String -> String -> Int -> IO ()
playGame word guessed triesLeft = do
    putStrLn $ "Word: " ++ showWord word guessed
    putStrLn $ "Tries left: " ++ show triesLeft
    putStr "Guess a letter: "
    guess <- getLine
    let letter = toLower (head guess)
    if letter `elem` guessed then do
        putStrLn "You already guessed that letter!"
        playGame word guessed triesLeft
    else if letter `elem` word then do
        putStrLn "Good guess!"
        let newGuessed = letter : guessed
        if gameWon word newGuessed then
            putStrLn $ "Congratulations! You guessed the word: " ++ word
        else
            playGame word newGuessed triesLeft
    else do
        putStrLn "Wrong guess!"
        let newTriesLeft = triesLeft - 1
        if newTriesLeft == 0 then
            putStrLn $ "Game over! The word was: " ++ word
        else
            playGame word guessed newTriesLeft

main :: IO ()
main = do
    hSetBuffering stdin NoBuffering 
    let word = "haskell"  
    let triesLeft = 6  
    playGame word "" triesLeft
