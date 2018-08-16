module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List


-- Model


type alias Model =
    { todos : List String
    }


initialModel : Model
initialModel =
    Model []



-- Messages


type Msg
    = Add String
    | Delete Int



-- Update


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add todo ->
            { model
                | todos = todo :: model.todos
            }

        Delete i ->
            { model
                | todos =
                    List.append
                        (List.take (i - 1) model.todos)
                        (List.drop i model.todos)
            }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "type here" ] []
        , button [ onClick (Add "New Todo") ] [ text "add" ]
        , ul []
            (List.map
                (\item -> li [] [ text item ])
                model.todos
            )
        ]


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
