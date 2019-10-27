module Main exposing (main, update, view)

import Browser
import Html as Html
import Html.Attributes as Attr
import Html.Events as Events
import Message
import Model exposing (Model)
import ReferenceText as RT


main =
    Browser.sandbox
        { init =
            { reference = "This is the text you're supposed to be writing."
            , actual = ""
            , isTyping = False
            }
        , update = update
        , view = view
        }


update : Message.KeyPress String -> Model -> Model
update msg model =
    case msg of
        Message.StartedTyping newActual ->
            { model | actual = newActual }

        Message.FinishedTyping newActual ->
            model

        Message.JustTyping newActual ->
            { model | actual = newActual }


view : Model -> Html.Html (Message.KeyPress String)
view model =
    Html.div []
        [ RT.referenceView model
        , Html.div [] []
        , RT.actualView model
        ]
