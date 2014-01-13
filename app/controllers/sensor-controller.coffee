SensorModel = require 'models/sensor-model'
SensorCollection = require 'models/sensor-collection'

SensorCollectionView = require 'views/sensor/sensor-view'
SensorEditView = require 'views/sensor/sensor-edit'
SensorCollectionView = require 'views/sensor/sensor-collectionview'

module.exports = class SensorController extends Marionette.Controller

    initialize: (options) ->
        @application = options.application
  	#TODO Initialize

    index: =>
        sensors = new SensorCollection()
        sensors.fetch(
          success: =>
            sensorsView = new SensorCollectionView({collection: sensors})
            @application.layout.content.show(sensorsView)
        )

    edit: (sensor_id) =>
        console.log sensor_id
        sensor = new SensorModel()
        sensor.set({'sensor_id', sensor_id})
        sensor.fetch(
            success: =>
                sensorEdit = new SensorEditView(model : sensor)
                @application.layout.content.show(sensorEdit)  
        )
