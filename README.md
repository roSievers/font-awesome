# Icons from FontAwesome

The roSievers/font-awesome library provides Font Awesome icons for use with elm-html.

The module `FontAwesome.Icons` exposes all available icon classes from the Font Awesome project. The function `toHtml` is used to turn an `Icon` into an `Html msg`.

```elm
import FontAwesome exposing (Icon, toHtml)
import FontAwesome.Icons as Fa

cake_icon = Fa.birthday_cake : Icon

cake_html = toHtml Fa.birthday_cake : Html msg
```

You can modify the intermediate `Icon` value before turning it into Html.

```elm
import FontAwesome.Modifiers as FaMod

myIcon =
  Fa.birthday_cake
    |> FaMod.double
    |> FaMod.rotate90
    |> toHtml
```

This corresponds to a scaled and rotated birthday cake icon. The Html is as follows:

```html
<span class="fa fa-birthday-cake fa-2x fa-rotate-90"></span>
```
