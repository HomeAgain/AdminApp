Config = require 'config'
application = require 'application'

module.exports = class SigninView extends Backbone.Marionette.ItemView
    id: 'login-view'
    template: 'views/templates/signin'
    events:
        'submit form': 'submit'

    submit: (e) ->
        e.preventDefault();
        username = $('#loginForm #username').val()
        console.log username
        password = $('#loginForm #password').val()
        console.log password
        $.ajax
            contentType: 'application/json'
            type: "POST"
            url: Config.apiroot + Config.approot + 'login/'
            data: JSON.stringify
                username: username
                password: password

            success: (data) ->
                if data.user_id && data.api_key
                    application.user_id = data.user_id;
                    application.api_key = data.api_key;

                    $.cookie('homeagainuid', data.user_id, {
                        expires: 7,
                        path: '/'
                    });
                    $.cookie('homeagainak', data.api_key, {
                        expires: 7,
                        path: '/'
                    });
                    Backbone.history.navigate('/sensor', true);

            
            error: () ->
                $('#loginForm #username').val('')
                $('#loginForm #password').val('')
            dataType: "json"

        console.log "Form submitted"

