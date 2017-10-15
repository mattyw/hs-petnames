module Lib
    ( someFunc
    , rand
    , rand'
    ) where

import System.Random


-- Would be nice if I could chain calls together.
randomChain :: RandomGen g => g -> [a] -> [a]
-- would return a list of random elements from the list
randomChain = undefined

randomIdx :: RandomGen g => g -> [a] -> a
randomIdx g ls = ls !! idx
    where (idx, _) = randomR (0, length ls) g

randomIdx' :: RandomGen g => g -> [a] -> (a, g)
randomIdx' g ls = (ls !! idx, g')
    where (idx, g') = randomR (0, length ls) g

rand :: [a] -> a
rand ls = randomIdx (mkStdGen 5) ls

rand' :: RandomGen g => g -> [a] -> (a,g)
rand' g ls = randomIdx' g ls

someFunc :: IO ()
someFunc = putStrLn "someFunc"
