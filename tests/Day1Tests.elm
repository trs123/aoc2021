module Day1Tests exposing (..)

import Input.Day1 exposing (input)
import Parsing
import Solutions.Day1 exposing (depthIncreases, slidingDepthIncreases)
import Test exposing (Test, describe, test)
import Util.ExpectExtra exposing (expectEqual)


suite : Test
suite =
    let
        depthMeasurements =
            Parsing.parseLines String.toInt input

        solutionDay1 =
            Result.map depthIncreases depthMeasurements

        solutionDay2 =
            Result.map slidingDepthIncreases depthMeasurements
    in
    describe "Sonar Sweep"
        [ describe "Part One"
            [ test "depthIncreases []" <| expectEqual 0 (depthIncreases [])
            , test "depthIncreases [1,2,3]" <| expectEqual 2 (depthIncreases [ 1, 2, 3 ])
            , test "depthIncreases [1, 0, 2, 1, 3]" <| expectEqual 2 (depthIncreases [ 1, 0, 2, 1, 3 ])
            , test "PUZZLE SOLUTION" <| expectEqual (Ok 1342) solutionDay1
            ]
        , describe "Part Two"
            [ test "slidingDepthIncreases []" <| expectEqual 0 (slidingDepthIncreases [])
            , test "slidingDepthIncreases [1,2,3,4]" <| expectEqual 1 (slidingDepthIncreases [ 1, 2, 3, 4 ])
            , test "slidingDepthIncreases example" <|
                expectEqual 5 (slidingDepthIncreases [ 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 ])
            , test "PUZZLE SOLUTION" <| expectEqual (Ok 1378) solutionDay2
            ]
        ]
