module Main exposing (..)

-- Imports
--import List exposing (..)
--import List as MyList exposing (..)

import List
import Maybe exposing (..)


-- Values


aNumber : Int
aNumber =
    777


aString : String
aString =
    "Hello"



-- Functions


add : number -> number -> number
add a b =
    a + b


add2 : number -> number
add2 =
    add 2



-- Flow Control
-- If else


greaterZero : Int -> Bool
greaterZero x =
    if x > 0 then
        True
    else
        False


type T
    = A String
    | B Int
    | C


cases : T -> String
cases t =
    case t of
        A s ->
            "A " ++ s

        B i ->
            "B" ++ Basics.toString i

        C ->
            "C"


testA =
    A "Hello"
        |> cases



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
    List.head l
        |> withDefault -1


firstFromList : List Int -> Int
firstFromList l =
    case l of
        first :: (second :: tail) ->
            first

        _ ->
            -1



-- Tuples


aTuple : ( Int, Int )
aTuple =
    ( 1, 2 )


first : ( Int, Int ) -> Int
first t =
    let
        ( first, second ) =
            t
    in
    first



-- Records


type alias R =
    { name : String
    , age : Int
    }


vR : R
vR =
    R "Me" 42


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
