module Tasks exposing (..)

import Http
import Types exposing (..)
import Json.Decode.Pipeline exposing (custom)
import Json.Decode exposing (Decoder, at, index, field, string, succeed)

getRandomProfile: Cmd Msg
getRandomProfile = Http.get {
    url = "https://randomuser.me/api",
    expect = Http.expectJson GotUser resultsDecoder
   }

resultsDecoder: Decoder User
resultsDecoder = field "results" (index 0 userDecoder)

userDecoder: Decoder User
userDecoder = succeed User
  |> custom (at ["name", "first"] string)
  |> custom (at ["name", "last"] string)
  |> custom (at ["login", "username"] string)
  |> custom (at ["picture", "large"] string)

