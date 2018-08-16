module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List
import Msg exposing (..)
import TodoList


-- Model


type alias Model =
    { todoList : TodoList.State
    }


initialModel : Model
initialModel =
    Model TodoList.initialState



-- Update


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTodoList ->
            model

        TodoListMsg msg ->
            { model | todoList = TodoList.update msg model.todoList }


view : Model -> Html Msg
view model =
    div []
        [ button [] [ text "+" ]
        , TodoList.view model.todoList TodoListMsg
        ]


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
