module Solutions.Day2.Part2.PositionWithAim exposing (..)

import Solutions.Day2.Command exposing (Command(..))


type alias PositionWithAim =
    { horizontal : Int, depth : Int, aim : Int }


zero =
    PositionWithAim 0 0 0


apply : Command -> PositionWithAim -> PositionWithAim
apply cmd pos =
    case cmd of
        Forward x ->
            { pos
                | horizontal = pos.horizontal + x
                , depth = pos.depth + x * pos.aim
            }

        Down x ->
            { pos | aim = pos.aim + x }

        Up x ->
            { pos | aim = pos.aim - x }


applyAll : PositionWithAim -> List Command -> PositionWithAim
applyAll =
    List.foldl apply
