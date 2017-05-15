{div, button} = require('react-elem').DOM

module.exports = ({className, style, text, clickHandler}) ->
    div style: style, ->
        button class: className, text, onClick: () -> clickHandler()
