import Test.HUnit

import Lib
import System.Exit
import Control.Monad
import System.Random

testGen = TestCase (do
    let gen = mkStdGen 5
    let (out, _) = generate gen 2 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" "bright-firefly" out
    let (out, _) = generate gen 3 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" "amazingly-enjoyed-cowbird" out
    let (out, _) = generate gen 4 "-" (Lib.lengthFilter 0)
    assertEqual "Test generate" "amazingly-partly-ideal-crane" out
    let (out, _) = generate gen 2 ":" (Lib.lengthFilter 0)
    assertEqual "Test generate" "bright:firefly" out
    let (out, _) = generate gen 2 "-" (Lib.lengthFilter 5)
    assertEqual "Test generate" "funny-louse" out
    --let (out, _) = generate gen 2 "-" (Lib.lengthFilter 3)
    --assertEqual "Test generate" "hip-hog" out
    )

testUbuntu = TestCase (do
    let gen = mkStdGen 5
    let (out, _) = ubuntu gen "-" (Lib.lengthFilter 3)
    assertEqual "Test generate" "hip-hog" out
    let (out, _) = ubuntu gen ":" (Lib.lengthFilter 3)
    assertEqual "Test generate" "hip:hog" out
    )
tests = TestList [
      testGen
    --, testUbuntu
    ]
main :: IO ()
main = do
    counts <- runTestTT tests
    when (failures counts > 0 || errors counts > 0)
        exitFailure
