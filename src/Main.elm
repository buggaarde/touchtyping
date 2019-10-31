module Main exposing (main, update, view)

import Browser
import Html as Html
import Html.Attributes as Attr
import Html.Events as Events
import View


type alias Model =
    { reference : String, actual : String, isTyping : Bool, doneTyping : Bool }


type KeyPress input
    = JustTyping input


main =
    Browser.sandbox
        { init =
            { reference = "The quick brown fox jumps over the lazy dog."
            , actual = ""
            , isTyping = False
            , doneTyping = False
            }
        , update = update
        , view = view
        }


update : KeyPress String -> Model -> Model
update msg model =
    case msg of
        JustTyping newActual ->
            if model.reference == model.actual then
                { model | doneTyping = True, actual = newActual }

            else if model.isTyping == False then
                { model | isTyping = True, actual = newActual }

            else
                { model | actual = newActual }


actual model =
    Html.input
        [ Attr.class "main"
        , Attr.placeholder "Start writing here"
        , Attr.value model.actual
        , Events.onInput JustTyping
        ]
        []


view : Model -> Html.Html (KeyPress String)
view model =
    Html.div [ Attr.class "app" ]
        [ View.reference model
        , actual model
        ]
