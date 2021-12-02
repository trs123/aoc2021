module Solutions.Day2.Command.Parsing exposing (..)

import Solutions.Day2.Command exposing (Command(..))


{-| Parse a Command
-}
parseCommand : String -> Maybe Command
parseCommand s =
    let
        toCmd cmd val =
            String.toInt val |> Maybe.map cmd
    in
    case String.split " " s of
        cmd :: val :: [] ->
            case cmd of
                "forward" ->
                    toCmd Forward val

                "down" ->
                    toCmd Down val

                "up" ->
                    toCmd Up val

                _ ->
                    Nothing

        _ ->
            Nothing
