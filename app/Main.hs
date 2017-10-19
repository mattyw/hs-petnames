module Main where

import Lib
import Options.Applicative
import Data.Semigroup ((<>))
import System.Random

data Opts = Opts
    { words :: Int
    , letters :: Int
    , seperator :: String
    , complexity :: Int
    , ubuntu :: Bool
    }

options :: Parser Opts
options = Opts
    <$> option auto
        ( long "words"
        <> short 'w'
        <> metavar "INT"
        <> help "Number of words in the name"
        <> showDefault
        <> value 2 )
    <*> option auto
        ( long "letters"
        <> short 'l'
        <> metavar "INT"
        <> help "Maximum number of letters in each word"
        <> showDefault
        <> value 0 )
    <*> option auto
        ( long "seperator"
        <> short 's'
        <> metavar "STR"
        <> help "String used to seperate name words"
        <> showDefault
        <> value "-" )
    <*> option auto
        ( long "complexity"
        <> short 'c'
        <> metavar "INT"
        <> help "0 = easy words, 1 = standard words, 2 = complex words"
        <> showDefault
        <> value 1 )
    <*> switch
        ( long "ubuntu"
        <> short 'u'
        <> help "generate ubuntu-style names, alliteration of first character of each word" )

run :: Opts -> IO ()
run (Opts w l s c False) = do
    g <- getStdGen
    let (name, _) = generate g w s (Lib.lengthFilter l)
    putStrLn name
run (Opts w l s c True) = do
    g <- getStdGen
    let (name, _) = Lib.ubuntu g s (Lib.lengthFilter l)
    putStrLn name

main :: IO ()
main = run =<< execParser opts
    where
        opts = info (options <**> helper)
            ( fullDesc
            <> progDesc "A utility to generate \"pet names\", consisting of a random combination of adverbs, an adjective and an animal name" )
