Config = require 'config'

module.exports = class SensorModel extends Backbone.Model
    urlRoot: Config.apiroot + Config.approot +  'sensors/'

    idAttribute: '_id'
    defaults:
        name: 'MySensor'
    
    schema:
        name: 'Text'
        sensor_id:
            title : 'ID'
            editorAttrs:
                disabled: true
        model:
            type: 'Select'
            title : 'Model'
            options: ['temperature', 'door']
            editorAttrs:
                disabled: true
        room_id:
            type: 'Select'
            title : 'Room'
            options: ->
                options = [
                    val: 0
                    label:"Unassigned"
                ]
                $.getJSON Config.apiroot + Config.approot +  'rooms/', (rooms) ->
                    rooms.forEach (room)->
                        options.push
                            val: room['_id']
                            label: room['name']
                options
