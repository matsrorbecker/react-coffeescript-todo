{div, span, input, button, i} = require('react-elem').DOM

module.exports = ({item, removeTodo, updateTodo}) ->
    {description, completed} = item
    div class: 'input-group input-group-lg', style: {marginTop: '10px'}, ->
        span class: 'input-group-addon', ->
            input type: 'checkbox', checked: completed
            , onChange: () ->
                updateTodo description, completed
        input class: 'form-control', type: 'text', value: description, readOnly: true
        span class: 'input-group-btn', ->
            button class: 'btn btn-danger', type: 'button', ->
                i class: 'glyphicon glyphicon-remove'
            , onClick: () ->
                removeTodo description, completed
