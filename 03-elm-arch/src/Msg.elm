module Msg exposing (Msg(..))

import TodoList


-- Messages


type Msg
    = AddTodoList
    | TodoListMsg TodoList.Msg
