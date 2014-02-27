Config = require 'config'

module.exports = class SensorModel extends Backbone.Model
    urlRoot: Config.apiroot + Config.approot +  'sensors/'

    idAttribute: '_id'
    defaults:
        name: 'Sensor'
    
    schema:
        name: 'Text'
        identifier:
            title : 'ID'
            editorAttrs:
                disabled: true
        model: 
            type: 'Object'
            subSchema: 
                name:
                    type: 'Select'
                    title : 'Model'
                    options: ['temperature', 'door', 'moisture', 'presence']
                _id :
                    type : 'Hidden'
                __v :
                    type : 'Hidden'
            editorAttrs:
                    disabled: true
                
        room:
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
