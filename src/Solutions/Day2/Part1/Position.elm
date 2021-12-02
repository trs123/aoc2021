module Solutions.Day2.Part1.Position exposing (..)

import Solutions.Day2.Command exposing (Command(..))


type alias Position =
    { horizontal : Int, depth : Int }


zero =
    Position 0 0


apply : Command -> Position -> Position
apply cmd pos =
    case cmd of
        Forward x ->
            { pos | horizontal = pos.horizontal + x }

        Down x ->
            { pos | depth = pos.depth + x }

        Up x ->
            { pos | depth = pos.depth - x }


applyAll : Position -> List Command -> Position
applyAll =
    List.foldl apply
