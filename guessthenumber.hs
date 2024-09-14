import System.Random (randomRIO)

main :: IO ()
main = do
  putStrLn "Guest Number Beetween 1 to 100"
  secretNumber <- randomRIO(1,  100)
  guessLoop secretNumber

guessLoop :: Int -> IO ()
guessLoop secretNumber = do
    putStr "Your guess: "
    guess <- getLine
    let guessNum = read guess :: Int
    if guessNum < secretNumber
        then do putStrLn "Too low!"
                guessLoop secretNumber
    else if guessNum > secretNumber
        then do putStrLn "Too high!"
                guessLoop secretNumber
    else putStrLn "Congratulations! You guessed it!"
