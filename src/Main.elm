module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view model =
    div []
        [ div []
            [ button [ onClick Increment ] [ Html.text "+" ]
            , p [] [ Html.text (String.fromInt model) ]
            , button [ onClick Decrement ] [ Html.text "-" ]
            ]
        , svg
            [ width "100%", height "100vh", viewBox "0 0 120 120", stroke "grey" ]
            [ rect [ x "20", y (String.fromInt ((\a -> 95 - a) model)), width "30", height (String.fromInt model), strokeWidth "0.2", stroke "grey", fill "grey" ] []
            , rect [ x "60", y (String.fromInt ((\a -> 95 - a) model)), width "30", height (String.fromInt model), strokeWidth "0.2", stroke "grey", fill "grey" ] []
            , line [ x1 "10", y1 "95", x2 "100", y2 "95", strokeWidth "0.2", stroke "grey" ] []
            , line [ x1 "10", y1 "10", x2 "10", y2 "95", strokeWidth "0.2", stroke "grey" ] []
            ]
        ]
