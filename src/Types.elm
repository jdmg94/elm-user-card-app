module Types exposing (..)

import Http exposing (Error)

type Model = Loading | Fail | Success User
type Msg = AnotherOne | GotUser (Result Error User)
type alias User = { firstName : String, lastName : String, username: String,  picture : String }
