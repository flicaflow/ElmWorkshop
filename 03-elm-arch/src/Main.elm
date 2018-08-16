module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List
import Msg exposing (..)
import TodoList


-- Model


type alias Model =
    { todos : List String
    , inputText : String
    }


initialModel : Model
initialModel =
    Model [] ""



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


todoConfig =
    { updateInput = UpdateInput
    , add = Add
    , delete = Delete
    }


view : Model -> Html Msg
view model =
    div []
        [ button [] [ text "+" ]
        , TodoList.view todoConfig model.todos model.inputText
        ]


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
