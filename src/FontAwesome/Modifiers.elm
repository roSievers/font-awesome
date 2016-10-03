module FontAwesome.Modifiers
    exposing
        ( small
        , large
        , double
        , tripple
        , quadruple
        , quintuple
        , fixWidth
        , withBorder
        , pullLeft
        , pullRight
        , spinning
        , pulsing
        , rotate90
        , rotate180
        , rotate270
        , flipHorizontal
        , flipVertical
        )

{-|

A modifier is a function `Icon -> Icon`. They are nice when used with `|>`.

@docs double, fixWidth, flipHorizontal, flipVertical, large, pullLeft, pullRight, pulsing, quadruple, quintuple, rotate180, rotate270, rotate90, small, spinning, tripple, withBorder

-}

import FontAwesome.Internals exposing (..)


setSize : Size -> Icon -> Icon
setSize size (Icon data) =
    Icon { data | size = size }


{-| -}
small : Icon -> Icon
small =
    setSize Small


{-| -}
large : Icon -> Icon
large =
    setSize Large


{-| -}
double : Icon -> Icon
double =
    setSize Double


{-| -}
tripple : Icon -> Icon
tripple =
    setSize Tripple


{-| -}
quadruple : Icon -> Icon
quadruple =
    setSize Quadruple


{-| -}
quintuple : Icon -> Icon
quintuple =
    setSize Quintuple


{-| -}
fixWidth : Icon -> Icon
fixWidth (Icon data) =
    Icon { data | fixedWidth = True }


{-| -}
withBorder : Icon -> Icon
withBorder (Icon data) =
    Icon { data | border = True }


{-| -}
setPull : PullDirection -> Icon -> Icon
setPull pull (Icon data) =
    Icon { data | pull = pull }


{-| -}
pullLeft : Icon -> Icon
pullLeft =
    setPull PullLeft


{-| -}
pullRight : Icon -> Icon
pullRight =
    setPull PullRight


{-| -}
spinning : Icon -> Icon
spinning (Icon data) =
    Icon { data | spin = Spinning }


{-| -}
pulsing : Icon -> Icon
pulsing (Icon data) =
    Icon { data | spin = Pulsing }


{-| -}
rotateBy : Int -> Rotation -> Rotation
rotateBy steps rotation =
    { rotation | turn = rotation.turn + steps }


{-| Makes use of the equation r_{ i } s = s r_{ -i }
-}
mirror : Rotation -> Rotation
mirror rotation =
    { turn = -rotation.turn
    , mirrored = not rotation.mirrored
    }


{-| -}
rotationMap : (Rotation -> Rotation) -> Icon -> Icon
rotationMap function (Icon data) =
    Icon { data | rotation = function data.rotation }


{-| -}
rotate90 : Icon -> Icon
rotate90 =
    rotationMap (rotateBy 1)


{-| -}
rotate180 : Icon -> Icon
rotate180 =
    rotationMap (rotateBy 2)


{-| -}
rotate270 : Icon -> Icon
rotate270 =
    rotationMap (rotateBy 3)


{-| -}
flipVertical : Icon -> Icon
flipVertical =
    rotationMap mirror


{-| -}
flipHorizontal : Icon -> Icon
flipHorizontal =
    rotationMap (mirror >> rotateBy 2)


{-| -}
hideAria : Icon -> Icon
hideAria (Icon data) =
    Icon { data | ariaHidden = True }
