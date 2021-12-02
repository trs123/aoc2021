module Parsing exposing
    ( parseLines
    , parseParts
    )

{-| This module offers functions for parsing strings consisting of a sequence of parts
(e.g. lines separated by newlines or comma separated lists).


# Parsing lines

@docs parseLines


# Parsing parts

@docs parseParts

-}


{-| Parse each line of `input` with the given `lineParser`, collecting the results in a list.
When a parse error occurs (`lineParser` returns `Nothing`), answer `Err` with an error text containing
the line which failed to parse, otherwise answer `Ok` with the list of parsed values.
-}
parseLines : (String -> Maybe a) -> String -> Result String (List a)
parseLines lineParser input =
    String.lines input |> parseParts lineParser


{-| Parse each part of `input` (a list of parts) with the given `partParser`, collecting the results in a list.
When a parse error occurs, i.e. `partParser` returns `Nothing`, answer `Err` with an error text containing
the part which failed to parse, otherwise answer `Ok` with the list of parsed values.
-}
parseParts : (String -> Maybe a) -> List String -> Result String (List a)
parseParts partParser input =
    let
        iterate parts valuesSoFar =
            case parts of
                [] ->
                    Ok (List.reverse valuesSoFar)

                part :: rest ->
                    case partParser part of
                        Nothing ->
                            Err <| "could not parse '" ++ part ++ "'"

                        Just value ->
                            iterate rest (value :: valuesSoFar)
    in
    iterate input []
