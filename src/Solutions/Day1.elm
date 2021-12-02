module Solutions.Day1 exposing (..)

{-| Number of increases in list of depths.
-}

import List.Extra as List


depthIncreases : List Int -> Int
depthIncreases depths =
    List.zip depths (List.drop 1 depths)
        |> List.count (\( x, y ) -> x < y)


{-| Slide a window of width 3 over the given list and answer a list of the sums.
-}
slidingWindow : List Int -> List Int
slidingWindow depths =
    case depths of
        x :: y :: z :: rest ->
            (x + y + z) :: slidingWindow (y :: z :: rest)

        _ ->
            []


{-| Calculate number of depth increases based on sliding window.
-}
slidingDepthIncreases : List Int -> Int
slidingDepthIncreases =
    slidingWindow >> depthIncreases
