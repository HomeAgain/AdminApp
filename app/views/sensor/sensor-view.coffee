module.exports = class SensorView extends Backbone.Marionette.ItemView
    id : 'sensor-view'
    template: 'views/templates/sensor/sensor-view'

    initialize: ->
    	if @model.get('name') == ''
    		@model.set 'name', @model.get('model').name.charAt(0).toUpperCase() + @model.get('model').name.slice(1) + " sensor"

    	switch @model.get('model').name
    		when 'moisture' then @model.set 'sensor_class', 'panel-info' 
    		when 'temperature' then @model.set 'sensor_class', 'panel-success'
    		when 'door' then @model.set 'sensor_class', 'panel-warning'
    		when 'presence' then @model.set 'sensor_class', 'panel-danger'
    		else @model.set 'sensor_class', 'panel-primary'