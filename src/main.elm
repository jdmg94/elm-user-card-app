module Main exposing (..)

import Browser
import Types exposing (..)
import Styles exposing (..)
import Html exposing (Html)
import Html.Events exposing (onClick)
import Tasks exposing (getRandomProfile)

main = Browser.element 
  {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }

init: () -> (Model, Cmd Msg)
init _ = (Loading, getRandomProfile)

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

view: Model -> Html Msg
view model = container [ 
  case model of
    Loading -> loader []
    Fail -> loader []
    Success profile -> card [ 
      onTheLeft [ roundedImage profile.picture ],
      detail [
        title (profile.firstName ++ " " ++ profile.lastName),
        subtitle ("@" ++ profile.username),
        refresh [onClick AnotherOne]
        ]
      ]
  ]

update: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
  case msg of 
    AnotherOne -> (Loading, getRandomProfile)
    GotUser result -> 
      case result of 
        Ok profile -> (Success profile, Cmd.none)
        Err _ -> (Fail, Cmd.none)
