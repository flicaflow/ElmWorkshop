module TodoList exposing (Msg(..), State, initialState, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List


type Msg
    = Add String
    | Delete Int
    | UpdateInput String


type alias State =
    { todos : List String
    , inputText : String
    }


initialState : State
initialState =
    State [] ""


update : Msg -> State -> State
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


view : State -> (Msg -> msg) -> Html msg
view state tagger =
    div []
        [ h1 [] [ text "Todo List" ]
        , input
            [ type_ "text"
            , placeholder "type here"
            , value state.inputText
            , onInput UpdateInput
            ]
            []
        , button [ onClick (Add state.inputText) ] [ text "add" ]
        , ul []
            (List.indexedMap
                (\i item ->
                    li []
                        [ span [] [ text item ]
                        , button
                            [ onClick (Delete i)
                            ]
                            [ text "delete" ]
                        ]
                )
                state.todos
            )
        ]
        |> Html.map tagger
