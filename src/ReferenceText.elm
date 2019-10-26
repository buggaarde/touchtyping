module ReferenceText exposing (..)

import Html
import Html.Attributes as Attr


referenceText : String -> String -> Html.Html msg
referenceText reference actual =
    Html.div [ Attr.class "reference-text" ] [ Html.text reference ]
