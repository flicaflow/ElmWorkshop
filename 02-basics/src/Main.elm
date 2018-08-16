module Main exposing (..)

-- Imports
--import List exposing (..)
--import List as MyList exposing (..)

import List


-- Values


aNumber : number
aNumber =
    777


aString : String
aString =
    "Hello"



-- Functions


add : number -> number -> number
add a b =
    a + b



-- Flow Control
-- If else


greaterZero : comparable -> Bool
greaterZero x =
    if x > 0 then
        True
    else
        False


type T
    = A
    | B
    | C


toString : T -> String
toString t =
    case t of
        A ->
            "A"

        B ->
            "B"

        C ->
            "C"



-- let


normalize1 : ( Float, Float, Float ) -> ( Float, Float, Float )
normalize1 ( a, b, c ) =
    ( a / (a + b + c), b / (a + b + c), c / (a + b + c) )


normalize2 : ( Float, Float, Float ) -> ( Float, Float, Float )
normalize2 ( a, b, c ) =
    let
        sum =
            a + b + c
    in
    ( a / sum, b / sum, c / sum )



-- Lists


aList : List Int
aList =
    [ 1, 2, 3, 4, 5 ]


addOnFront : List Int
addOnFront =
    0 :: aList


firstFromList1 : List Int -> Int
firstFromList1 l =
    let
        maybeFirst =
            List.head l
    in
    case maybeFirst of
        Just f ->
            f

        Nothing ->
            -1


firstFromList : List Int -> Int
firstFromList l =
    case l of
        first :: _ ->
            first

        _ ->
            -1



-- Tuples


aTuple : ( Int, Int )
aTuple =
    ( 1, 2 )


first : ( Int, Int ) -> Int
first ( first, second ) =
    first



-- Records


type alias R =
    { name : String
    , age : Int
    }


vR : R
vR =
    { name = "Me"
    , age = 42
    }


printR : R -> String
printR r =
    Debug.log "R: " (r.name ++ " (" ++ Basics.toString r.age ++ ")")


testPrintR : String
testPrintR =
    printR { name = "Me", age = 33 }



-- Updating Records


changeAge : R -> R
changeAge r =
    { r | age = r.age + 1 }



-- Extensible Records


type alias ExtR rest =
    { rest
        | name : String
        , age : Int
    }


print : ExtR a -> String
print er =
    er.name ++ " (" ++ Basics.toString er.age ++ ")"


letItPrint : String
letItPrint =
    Debug.log
        "ExtR: "
        (print
            { a = 1.2
            , name = "Me"
            , age = 33
            }
        )



-- Pipes


noPipes : Float -> Float -> Float
noPipes a b =
    sqrt
        (max 10
            (min 100 (add a b))
        )


withPipes : Float -> Float -> Float
withPipes a b =
    add a b
        |> min 100
        |> max 10
        |> sqrt


withMorePipes : Float -> Float -> Float
withMorePipes a b =
    a
        |> add b
        |> min 100
        |> max 10
        |> sqrt
