module FontAwesome
    exposing
        ( Icon
        , toHtml
        )

import Html exposing (span, Html)
import Html.Attributes exposing (class, attribute)
import List
import FontAwesome.Internals as I
    exposing
        ( Size(..)
        , PullDirection(..)
        , SpinType(..)
        )


type alias Rotation =
    { turn : Int
    , mirrored : Bool
    }


type alias Icon =
    I.Icon


toHtml : Icon -> Html msg
toHtml (I.Icon data) =
    span
        [ compileClass
            [ Just data.base
            , sizeClass data.size
            , fixedWidthClass data.fixedWidth
            , borderClass data.border
            , pullClass data.pull
            , spinClass data.spin
            , rotationClass data.rotation
            ]
        , attribute "aria-hidden"
            (if data.ariaHidden then
                "true"
             else
                "false"
            )
        ]
        []


compileClass : List (Maybe String) -> Html.Attribute msg
compileClass classes =
    classes
        |> List.filterMap identity
        |> List.foldl addClass "fa"
        |> class


addClass : String -> String -> String
addClass current new =
    current ++ " " ++ new


sizeClass : Size -> Maybe String
sizeClass size =
    case size of
        Small ->
            Nothing

        Large ->
            Just "fa-lg"

        Double ->
            Just "fa-2x"

        Tripple ->
            Just "fa-3x"

        Quadruple ->
            Just "fa-4x"

        Quintuple ->
            Just "fa-5x"


fixedWidthClass : Bool -> Maybe String
fixedWidthClass fix =
    if fix then
        Just "fa-fx"
    else
        Nothing


borderClass : Bool -> Maybe String
borderClass border =
    if border then
        Just "fa-border"
    else
        Nothing


pullClass : PullDirection -> Maybe String
pullClass pull =
    case pull of
        PullNowhere ->
            Nothing

        PullLeft ->
            Just "fa-pull-left"

        PullRight ->
            Just "fa-pull-right"


spinClass : SpinType -> Maybe String
spinClass spin =
    case spin of
        Static ->
            Nothing

        Spinning ->
            Just "fa-spin"

        Pulsing ->
            Just "fa-puls"


rotationClass : Rotation -> Maybe String
rotationClass rotation =
    case ( rotation.turn % 4, rotation.mirrored ) of
        ( 0, False ) ->
            Nothing

        ( 1, False ) ->
            Just "fa-rotate-90"

        ( 2, False ) ->
            Just "fa-rotate-180"

        ( 3, False ) ->
            Just "fa-rotate-270"

        ( 0, True ) ->
            Just "fa-flip-vertical"

        ( 1, True ) ->
            Just "fa-rotate-90"

        ( 2, True ) ->
            Just "fa-flip-horizontal"

        ( 3, True ) ->
            Just "fa-rotate-270"

        ( _, _ ) ->
            Nothing
