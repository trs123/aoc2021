module Day2Tests exposing (..)

import Input.Day2 exposing (input)
import Parsing
import Solutions.Day2.Command exposing (Command(..))
import Solutions.Day2.Command.Parsing exposing (parseCommand)
import Solutions.Day2.Part1.Position as Position
import Solutions.Day2.Part2.PositionWithAim as PositionWithAim
import Test exposing (Test, describe, test)
import Util.ExpectExtra exposing (expectEqual)


suite : Test
suite =
    let
        commands =
            Parsing.parseLines parseCommand input

        exampleCommands =
            [ Forward 5, Down 5, Forward 8, Up 3, Down 8, Forward 2 ]

        toSolution pos =
            pos.horizontal * pos.depth

        solutionDay1 =
            Result.map (Position.applyAll Position.zero >> toSolution) commands

        solutionDay2 =
            Result.map (PositionWithAim.applyAll PositionWithAim.zero >> toSolution) commands
    in
    describe "Dive!"
        [ describe "Part One"
            [ test "applyAll exampleCommands" <|
                expectEqual
                    { horizontal = 15, depth = 10 }
                    (Position.applyAll Position.zero exampleCommands)
            , test "PUZZLE SOLUTION" <| expectEqual (Ok 2215080) solutionDay1
            ]
        , describe "Part Two"
            [ test "applyAll exampleCommands" <|
                expectEqual
                    { horizontal = 15, depth = 60, aim = 10 }
                    (PositionWithAim.applyAll PositionWithAim.zero exampleCommands)
            , test "PUZZLE SOLUTION" <| expectEqual (Ok 1864715580) solutionDay2
            ]
        ]
