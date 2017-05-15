{div, input, span, button, i} = require('react-elem').DOM

module.exports = ({addTodo}) ->
    todoInput = null;
    div class: 'input-group input-group-lg', ->
        input type: 'text', class: 'form-control', placeholder: 'Ny viktig sak'
        , ref: (input) -> 
            todoInput = input
        span class: 'input-group-btn', ->
            button class: 'btn btn-success', type: 'button', ->
                i class: 'glyphicon glyphicon-plus'
            , onClick: () ->
                addTodo todoInput.value
                todoInput.value = ''
