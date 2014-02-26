RoomModel = require 'models/room-model'
Config = require 'config'

module.exports = class RoomCollection extends Backbone.Collection
    url: Config.apiroot + Config.approot + 'rooms/'
    model : RoomModel
