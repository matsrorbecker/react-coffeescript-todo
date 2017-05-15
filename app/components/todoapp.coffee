{Component, createElement} =    require 'react'
{docapture} =                   require 'react-elem'
{div} =                         require('react-elem').DOM
TodoHeader =                    require './todoheader'
TodoInput =                     require './todoinput'
TodoList =                      require './todolist'
ToggleButton =                  require './togglebutton'

class TodoApp extends Component

    constructor: () ->
        super

        @state =
            todoItems: []
            todoCount: 0
            filterCompleted: false

    addTodo: (todo) =>
        {todoItems, todoCount} = @state

        todoItems.unshift 
            description: todo
            completed: false

        @setState 
            todoItems: todoItems
            todoCount: todoCount + 1

    removeTodo: (todo, completed) =>
        {todoItems, todoCount} = @state

        todoItems = todoItems.filter (todoItem) ->
            if todoItem.description isnt todo then todoItem

        @setState
            todoItems: todoItems
            todoCount: if completed then todoCount else todoCount - 1

    updateTodo: (todo, completed) =>
        {todoItems, todoCount} = @state
        completed = not completed # toggle

        todoIndex = todoItems.findIndex (todoItem) ->
            todoItem.description is todo
        todoItems[todoIndex] =
            description: todoItems[todoIndex].description
            completed: completed

        @setState
            todoItems: todoItems
            todoCount: if completed then todoCount - 1 else todoCount + 1

    toggleFilterCompleted: () =>
        {filterCompleted} = @state

        @setState
            filterCompleted: not filterCompleted

    render: () => div =>
        {todoItems, todoCount, filterCompleted} = @state

        TodoHeader thingsToDo: todoCount

        div class: 'container', =>
            TodoInput {@addTodo}
            TodoList {todoItems, @removeTodo, @updateTodo, filterCompleted}
            ToggleButton
                className: 'btn btn-primary btn-lg'
                style: {marginTop: '10px', textAlign: 'right'}
                text: if filterCompleted then 'Visa gjorda saker' else 'Dölj gjorda saker'
                clickHandler: @toggleFilterCompleted

module.exports = () ->
    docapture createElement(TodoApp)
