module ReferenceText exposing (..)

import Html
import Html.Attributes as Attr
import Html.Events as Events
import Message
import Model exposing (Model)
import String


referenceView : Model -> Html.Html msg
referenceView model =
    let
        actualLength =
            String.length model.actual

        referenceLength =
            String.length model.reference

        match =
            String.startsWith model.actual model.reference
    in
    Html.p [ Attr.class "reference" ]
        [ Html.mark
            [ Attr.class
                (if match then
                    "green"

                 else
                    "red"
                )
            ]
            [ model.reference
                |> String.left actualLength
                |> Html.text
            ]
        , Html.mark [ Attr.class "neutral" ]
            [ model.reference
                |> String.right (referenceLength - actualLength)
                |> Html.text
            ]
        ]


actualView : Model -> Html.Html (Message.KeyPress String)
actualView model =
    Html.input
        [ Attr.placeholder "Start writing here"
        , Attr.value model.actual
        , Events.onInput Message.JustTyping
        ]
        []
