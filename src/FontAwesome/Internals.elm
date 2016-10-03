module FontAwesome.Internals exposing (..)


type Icon
    = Icon
        { base : String
        , size : Size
        , fixedWidth : Bool
        , border : Bool
        , pull : PullDirection
        , spin : SpinType
        , rotation : Rotation
        , ariaHidden : Bool
        }


base : String -> Icon
base class =
    Icon
        { base = class
        , size = Small
        , fixedWidth = False
        , border = False
        , pull = PullNowhere
        , spin = Static
        , rotation = upright
        , ariaHidden = False
        }


type Size
    = Small
    | Large
    | Double
    | Tripple
    | Quadruple
    | Quintuple


type PullDirection
    = PullNowhere
    | PullLeft
    | PullRight


type SpinType
    = Static
    | Spinning
    | Pulsing


{-| Unfortunately Font Awesome does not implement the whole Dihedral-4 Group
    (see https://en.wikipedia.org/wiki/Dihedral_group) but only a subset.
    This means the rotation value might no be representable with a class.
    In this case a simmilar class is choosen, where the top of the icon
    points in the correct direction.

    The elements are internally represented as r_i or s_0 after r_i.
-}
type alias Rotation =
    { turn : Int
    , mirrored : Bool
    }

upright : Rotation
upright =
    { turn = 0, mirrored = False }
