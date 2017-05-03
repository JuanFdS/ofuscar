module Ofuscar exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Char exposing (..)

main = Html.beginnerProgram { model = model, update = update, view = view }

type alias Model = String

type Msg = NuevoTexto String

model : Model
model = ""

update : Msg -> Model -> Model
update msg model =
  case msg of
    NuevoTexto nuevoTexto -> ofuscar nuevoTexto

ofuscar texto = texto |> String.words |> List.map (String.map siguienteLetra) |> String.join " "

siguienteLetra letra =
  case letra of
    'z' -> 'a'
    'Z' -> 'A'
    otraLetra -> if esLetra letra then letra |> Char.toCode |> (+) 1 |> Char.fromCode else letra

esLetra letra = Char.isLower letra || Char.isUpper letra

view : Model -> Html Msg
view model = div [] [ textarea [onInput NuevoTexto] [], text model ]
