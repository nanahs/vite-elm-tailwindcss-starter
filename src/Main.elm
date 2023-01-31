module Main exposing (Msg(..), main)

import Browser
import Html exposing (Html)
import Html.Events as Events


type alias Model =
    { count : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { count = 0 }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.h1 [] [ Html.text "Vite and Elm starter" ]
        , Html.div []
            [ Html.button [ Events.onClick Increment ] [ Html.text "+1" ]
            , Html.div [] [ Html.text (String.fromInt model.count) ]
            , Html.button [ Events.onClick Decrement ] [ Html.text "-1" ]
            ]
        ]


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> init
        , update = update
        , view =
            \model ->
                { title = "elm-template"
                , body = [ view model ]
                }
        , subscriptions = \_ -> Sub.none
        }
