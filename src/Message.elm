module Message exposing (..)


type KeyPress input
    = StartedTyping input
    | FinishedTyping input
    | JustTyping input
