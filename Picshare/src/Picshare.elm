module Picshare exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Browser


baseUrl : String
baseUrl =
    "https://programming-elm.com/"


initialModel : { url : String, caption : String,liked:Bool }
initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "Surfing"
    , liked=False
    }


viewDetailedPhoto :
    { url : String, caption : String, liked:Bool } -> Html Msg
viewDetailedPhoto model =
    let
        buttonClass =
            if model.liked then
                "fa-heart"
            else
                "fa-heart-o"
        msg =
            if model.liked then
                Unlike
            else
                Like
        in
        div [ class "detailed-photo" ]
            [ img [ src model.url ] []
            , div [ class "photo-info" ]
            [div [class "like-button"]
                [i
                    [class "fa fa-2x"
                    ,class buttonClass
                    ,onClick msg
                    ]
                    []
                ]
                ,h2 [ class "caption" ] [ text model.caption ]
                ]
            ]


view : { url : String, caption : String, liked :Bool } -> Html Msg
view model =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Picshare" ] ]
        , div [ class "conent-flow" ]
            [ viewDetailedPhoto model ]
        ]

type Msg
    = Like
    | Unlike

update :
    Msg
    -> { url : String, caption : String, liked :Bool }
    -> { url : String, caption : String, liked :Bool }
update msg model =
    case msg of
        Like ->
            {model | liked =True}
        Unlike ->
            {model | liked =False}

main : Program() { url:String, caption:String, liked:Bool } Msg
main =
module Main exposing (main)

import Browser
import Html exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }


type alias Model =
    { property : Int
    , property2 : String
    }


init : Model
init =
    Model 0 "modelInitialValue2"


type Msg
    = Msg1
    | Msg2


update : Msg -> Model -> Model
update msg model =
    case msg of
        Msg1 ->
            model

        Msg2 ->
            model


view : Model -> Html Msg
view model =
    div []
        [ text "New Sandbox" ]

    view initialModel
