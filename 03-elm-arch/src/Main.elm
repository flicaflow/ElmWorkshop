module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List


-- Model


type alias Model =
    { todos : List String
    , inputText : String
    }


initialModel : Model
initialModel =
    Model [] ""



-- Messages


type Msg
    = Add String
    | Delete Int
    | UpdateInput String



-- Update


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add todo ->
            { model
                | todos = todo :: model.todos
                , inputText = ""
            }

        Delete i ->
            { model
                | todos =
                    List.append
                        (List.take i model.todos)
                        (List.drop (i + 1) model.todos)
            }

        UpdateInput inp ->
            { model
                | inputText = inp
            }


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "text"
            , placeholder "type here"
            , value model.inputText
            , onInput UpdateInput
            ]
            []
        , button [ onClick (Add model.inputText) ] [ text "add" ]
        , ul []
            (todoItems model)
        ]


type alias TModel a =
    { a | todos : List String }


todoItems : TModel Model -> List (Html Msg)
todoItems model =
    List.indexedMap
        (\i item ->
            li []
                [ span [] [ text item ]
                , button
                    [ onClick (Delete i)
                    ]
                    [ text "delete" ]
                ]
        )
        model.todos


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
