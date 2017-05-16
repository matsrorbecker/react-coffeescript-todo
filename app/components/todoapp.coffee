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

        getLocalStorage = () ->
            try 
                localStorage = window.localStorage
                localStorage.setItem 'test', 'test'
                localStorage.removeItem 'test'
                localStorage
            catch error
                null

        @localStorage = getLocalStorage()
        oldState = @localStorage?.getItem('state') or null

        @state = JSON.parse(oldState) or
            todoItems: []
            todoCount: 0
            filterCompleted: false

    _setState: (newState) =>
        @setState newState
        @localStorage.setItem 'state', JSON.stringify(newState) if @localStorage

    addTodo: (todo) =>
        {todoItems, todoCount, filterCompleted} = @state

        todoItems.unshift 
            description: todo
            completed: false

        @_setState 
            todoItems: todoItems
            todoCount: todoCount + 1
            filterCompleted: filterCompleted

    removeTodo: (todo, completed) =>
        {todoItems, todoCount, filterCompleted} = @state

        todoItems = todoItems.filter (todoItem) ->
            if todoItem.description isnt todo then todoItem

        @_setState
            todoItems: todoItems
            todoCount: if completed then todoCount else todoCount - 1
            filterCompleted: filterCompleted

    updateTodo: (todo, completed) =>
        {todoItems, todoCount, filterCompleted} = @state
        completed = not completed # toggle

        todoIndex = todoItems.findIndex (todoItem) ->
            todoItem.description is todo
        todoItems[todoIndex] =
            description: todoItems[todoIndex].description
            completed: completed

        @_setState
            todoItems: todoItems
            todoCount: if completed then todoCount - 1 else todoCount + 1
            filterCompleted: filterCompleted

    toggleFilterCompleted: () =>
        {todoItems, todoCount, filterCompleted} = @state

        @_setState
            todoItems: todoItems
            todoCount: todoCount
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
