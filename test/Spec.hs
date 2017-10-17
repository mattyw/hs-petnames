import Test.HUnit

import Lib
import System.Exit
import Control.Monad
import System.Random

testGen = TestCase (do
    let gen = mkStdGen 5
    let (out, _) = generate gen 2 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" out "bright-firefly"
    let (out, _) = generate gen 3 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" out "amazingly-enjoyed-cowbird"
    let (out, _) = generate gen 4 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" out "amazingly-partly-ideal-crane"
    let (out, _) = generate gen 2 ":" (Lib.lengthFilter 0)
    assertEqual "Test generate" out "bright:firefly"
    let (out, _) = generate gen 2 "-" (Lib.lengthFilter 5)
    assertEqual "Test generate" out "funny-louse"
    let (out, _) = generate gen 2 "-" (Lib.lengthFilter 3)
    assertEqual "Test generate" out "hip-hog"
    )
tests = TestList [
    testGen
    ]
main :: IO ()
main = do
    counts <- runTestTT tests
    when (failures counts > 0 || errors counts > 0)
        exitFailure
