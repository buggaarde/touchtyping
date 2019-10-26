module Main exposing (main, update, view)

import Browser
import Html as Html
import Html.Attributes as Attr
import Html.Events as Events
import Message
import ReferenceText as RT


main =
    Browser.sandbox { init = 0, update = update, view = view }


update msg model =
    case msg of
        Message.KeyPress ->
            model

        Message.FinishedTyping ->
            model


view model =
    let
        placeholder =
            "Some text"
    in
    Html.div []
        [ RT.referenceText "This is the text you have to type." placeholder
        , Html.div [] []
        , Html.input [ Attr.placeholder placeholder ] []
        ]
