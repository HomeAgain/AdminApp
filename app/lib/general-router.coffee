application = require 'application'

GeneralController = require 'controllers/general-controller'

module.exports = class RoomRouter extends Marionette.AppRouter
  controller: new GeneralController(application : application)
  appRoutes: 
    'signup(/)': 'signup'
    'signin(/)': 'signin'

