SensorModel = require('models/sensor-model')

module.exports = class SensorCollection extends Backbone.Collection
    url: 'http://127.0.0.1:4000/sensor/'
    model : SensorModel
