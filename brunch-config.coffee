exports.config =

    files:
        javascripts: joinTo: 'app.js'
        stylesheets:
            joinTo: 'app.css'
            order:
                before: [
                    'app/*'
                ]