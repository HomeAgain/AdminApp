Config = require 'config'

module.exports = class SensorModel extends Backbone.Model
    urlRoot: Config.apiroot + Config.approot +  'sensors/'
    idAttribute: 'sensor_id'
    defaults:
        name: 'MySensor'
        sensor_id: ""
        room_id: ""
    
    schema:
        name: 'Text'
        sensor_id:
            editorAttrs:
                disabled: true
        model:
            type: 'Select'
            options: ['temperature', 'door']
            editorAttrs:
                disabled: true
        room_id:
            type: 'Select'
            options: ->
                options = [
                    val: 0
                    label:"Unassigned"
                ]
                $.getJSON 'http://localhost:4000/room/', (rooms) ->
                    rooms.forEach (room)->
                        options.push
                            val: room['_id']
                            label: room['name']
                options
