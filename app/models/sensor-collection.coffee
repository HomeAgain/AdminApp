SensorModel = require 'models/sensor-model'
Config = require 'config'

module.exports = class SensorCollection extends Backbone.Collection
    url: Config.apiroot + Config.approot +  'sensors/'
    model : SensorModel
