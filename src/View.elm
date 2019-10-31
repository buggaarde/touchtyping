module View exposing (reference)

import Html
import Html.Attributes as Attr
import Html.Events as Events
import String


overlapFromIndex : String -> String -> Int -> String
overlapFromIndex ref act index =
    let
        minLen =
            min (String.length ref) (String.length act)

        beginningSubstring =
            if minLen == 0 then
                ""

            else if index > minLen then
                String.left (index - 1) act

            else if String.left index ref /= String.left index act then
                String.left (index - 1) act

            else
                overlapFromIndex ref act (index + 1)
    in
    beginningSubstring


substringAtBeginning model =
    overlapFromIndex model.reference model.actual 0


reference model =
    let
        actualLength =
            String.length model.actual

        referenceLength =
            String.length model.reference

        fullMatch =
            String.startsWith model.actual model.reference

        longestMatch =
            substringAtBeginning model

        longestMatchLength =
            String.length longestMatch
    in
    Html.span
        [ Attr.class "reference"
        , Attr.class
            (if fullMatch then
                "matched"

             else
                "not-matched"
            )
        ]
        [ Html.mark
            [ Attr.class "green" ]
            [ Html.text longestMatch ]
        , Html.mark [ Attr.class "red" ]
            [ model.actual
                |> String.slice longestMatchLength actualLength
                |> Html.text
            ]
        , Html.mark [ Attr.class "neutral" ]
            [ model.reference
                |> String.right (referenceLength - actualLength)
                |> Html.text
            ]
        ]
