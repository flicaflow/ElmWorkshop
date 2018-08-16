module TodoList exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List


type alias Config msg =
    { updateInput : String -> msg
    , add : String -> msg
    , delete : Int -> msg
    }


view : Config msg -> List String -> String -> Html msg
view conf todos inputText =
    div []
        [ h1 [] [ text "Todo List" ]
        , input
            [ type_ "text"
            , placeholder "type here"
            , value inputText
            , onInput conf.updateInput
            ]
            []
        , button [ onClick (conf.add inputText) ] [ text "add" ]
        , ul []
            (List.indexedMap
                (\i item ->
                    li []
                        [ span [] [ text item ]
                        , button
                            [ onClick (conf.delete i)
                            ]
                            [ text "delete" ]
                        ]
                )
                todos
            )
        ]
