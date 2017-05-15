{div} = require('react-elem').DOM
Todo =  require './todo'

module.exports = ({todoItems, removeTodo, updateTodo}) ->
    div ->
        todoItems.map (item) ->
            Todo {item, removeTodo, updateTodo}
