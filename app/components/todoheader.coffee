{div, h1} = require('react-elem').DOM

NUMBER_STRINGS = [
    'Noll'
    'En'
    'Två'
    'Tre'
    'Fyra'
    'Fem'
    'Sex'
    'Sju'
    'Åtta'
    'Nio'
    'Tio'
    'Elva'
    'Tolv'
]

module.exports = ({thingsToDo}) ->
    number = if thingsToDo <= 12 then NUMBER_STRINGS[thingsToDo] else thingsToDo
    div class: 'jumbotron', ->
        div class: 'container', ->
            h1 "#{number} viktig#{if thingsToDo == 1 then '' else 'a'} sak#{if thingsToDo == 1 then '' else 'er'} att göra!"    