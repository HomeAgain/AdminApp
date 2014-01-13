application = require 'application'

RoomController = require 'controllers/room-controller'

module.exports = class RoomRouter extends Marionette.AppRouter
  controller: new RoomController(application : application)
  appRoutes: 
    'room(/)': 'index'
    'room/add(/)': 'add'
