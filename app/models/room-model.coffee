Config = require 'config'

module.exports = class RoomModel extends Backbone.Model
    urlRoot: Config.apiroot + Config.approot +  'rooms/'
    idAttribute: 'room_id'
    
    defaults :
        name: ''
    schema:
        name:
            type : 'Text'