
module.exports = class SignupView extends Backbone.Marionette.ItemView
    className: "signup"
    #el: $('#AppView')

    autoRender: on

    template: require 'views/templates/signup'
    events:
        'click form #submit': 'submit'

    submit: (e) ->
        e.preventDefault()
        username = $('#signupForm #username').val()
        password = $('#signupForm #password').val()
        $.ajax(
            contentType: 'application/json'
            type: "POST"
            url: "http://127.0.0.1:4000/signup"
            data: JSON.stringify(
                username: username
                password: password
            )
            success: (data) ->
                console.log("User added")
                Backbone.history.navigate('/admin/', true)
            error: ->
                $('#loginForm #username').val('')
                $('#loginForm #password').val('')
            dataType: "json"
        )
        console.log("Form submitted")
