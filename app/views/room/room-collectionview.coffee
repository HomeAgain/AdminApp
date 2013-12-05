RoomView = require 'views/room/room-view'

module.exports = class RoomCollectionView extends Backbone.Marionette.CollectionView
    initialize: ->
        this.collection.on('add', this.addOne, this)
        this.collection.on('reset', this.render, this)

    itemView: RoomView