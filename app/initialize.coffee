{createElement} =   require 'react'
{render} =          require 'react-dom'

TodoApp = require './components/todoapp'

document.addEventListener 'DOMContentLoaded', () ->
    render createElement(TodoApp), document.querySelector('#app')