application = require 'application'

SensorController = require 'controllers/sensor-controller'

module.exports = class SensorRouter extends Marionette.AppRouter
  controller: new SensorController(application : application)
  appRoutes: 
    'sensor(/)': 'index'
    'sensor/edit/:sensor_id(/)': 'edit'
