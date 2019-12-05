module Styles exposing (..)

import Types exposing (Msg)
import Html exposing (Html, text, img, div, p, button)
import Html.Attributes exposing (class, style, src)
import Html.Events

title: String -> Html Msg
title message = p [ class "text-xl"] [ text message ]

subtitle: String -> (Html Msg)
subtitle message =  p [ class "text-gray-500" ] [ text message ]

redText: String -> Html Msg
redText message = p [ class "text-mono text-center text-4xl text-red-600" ] [ text message ]

container: List (Html Msg) -> Html Msg
container = div [ class "flex flex-1 flex-col items-center justify-center h-full" ]

loader: List (Html Msg) -> Html Msg
loader = div [ 
  style "border" "4px solid #0000",
  style "border-top" "4px solid #38A169",
  class "w-20 h-20 rounded-full shadow spins"
  ]

onTheLeft: List (Html Msg) -> Html Msg
onTheLeft = div [ class "flex-shrink-0" ]

card: List (Html Msg) -> Html Msg
card = div [ class "flex bg-white rounded-lg shadow-lg p-4" ]

detail: List (Html Msg) -> Html Msg
detail = div [ class "md:ml-4 flex flex-col justify-center" ]

roundedImage: String -> Html Msg
roundedImage url = img [ class "rounded-full m-2", src url ] []

refresh: List (Html.Attribute Msg) -> Html Msg
refresh events = button (List.concat [[ class "text-white rounded bg-blue-600 hover:bg-blue-400 mt-4 p-2" ], events]) [ text "Refetch"]
