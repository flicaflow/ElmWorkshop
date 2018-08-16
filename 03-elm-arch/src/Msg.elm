module Msg exposing (Msg(..))

-- Messages


type Msg
    = Add String
    | Delete Int
    | UpdateInput String


type alias M2 =
    Msg
