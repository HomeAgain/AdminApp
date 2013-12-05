SensorView = require 'views/sensor/sensor-view'

module.exports = class SensorCollectionView extends Backbone.Marionette.CollectionView
    initialize: ->
        this.collection.on('add', this.render, this)
        this.collection.on('reset', this.render, this)
    
    itemView: SensorView