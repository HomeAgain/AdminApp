
SignupView = require 'views/signup-view'
SigninView = require 'views/signin-view'

module.exports = class SensorController extends Marionette.Controller

    initialize: (options) ->
        @application = options.application
  	#TODO Initialize
    signup: (request) ->
        #@loading()
        signupView = new SignupView()
        @application.layout.content.show(signupView)  

    signin: (request) ->
        #@loading()
        signinView = new SigninView()
        @application.layout.content.show(signinView)  