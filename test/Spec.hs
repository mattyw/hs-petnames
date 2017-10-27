import Test.HUnit

import Lib
import System.Exit
import Control.Monad
import System.Random

testGen = TestCase (do
    let gen = mkStdGen 5
    let (out, _) = generate 2 "-" (Lib.lengthFilter 0) gen
    assertEqual "Test generate" "bright-firefly" out
    let (out, _) = generate 3 "-" (Lib.lengthFilter 0) gen
    assertEqual "Test generate" "amazingly-enjoyed-cowbird" out
    let (out, _) = generate 4 "-" (Lib.lengthFilter 0) gen
    assertEqual "Test generate" "amazingly-partly-ideal-crane" out
    let (out, _) = generate 2 ":" (Lib.lengthFilter 0) gen
    assertEqual "Test generate" "bright:firefly" out
    let (out, _) = generate 2 "-" (Lib.lengthFilter 5) gen
    assertEqual "Test generate" "funny-louse" out
    --let (out, _) = generate gen 2 "-" (Lib.lengthFilter 3)
    --assertEqual "Test generate" "hip-hog" out
    )

testUbuntu = TestCase (do
    let gen = mkStdGen 5
    let (out, _) = ubuntu "-" (Lib.lengthFilter 5) 'a' gen
    assertEqual "Test generate" "above-alien" out
    let (out, _) = ubuntu ":" (Lib.lengthFilter 5) 'b' gen
    assertEqual "Test generate" "brave:bear" out
    )
tests = TestList [
      testGen
    , testUbuntu
    ]
main :: IO ()
main = do
    counts <- runTestTT tests
    when (failures counts > 0 || errors counts > 0)
        exitFailure
