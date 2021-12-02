module Util.ExpectExtra exposing (..)

import Expect exposing (Expectation)


expectEqual : a -> a -> (b -> Expectation)
expectEqual x y =
    \_ -> Expect.equal x y
