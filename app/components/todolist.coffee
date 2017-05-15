{div} = require('react-elem').DOM
Todo =  require './todo'

module.exports = ({todoItems, removeTodo, updateTodo, filterCompleted}) ->
    div ->
        todoItems.map (item) ->
            unless filterCompleted and item.completed
                Todo {item, removeTodo, updateTodo}
