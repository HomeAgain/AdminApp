RoomModel = require 'models/room-model'
RoomCollection = require 'models/room-collection'

RoomCollectionView = require 'views/room/room-view'
RoomAddView = require 'views/room/room-add'
RoomCollectionView = require 'views/room/room-collectionview'

module.exports = class RoomController extends Marionette.Controller

    initialize: (options) ->
        @application = options.application
        console.log "Initializing RoomController"
  	#TODO Initialize

    index: =>
        rooms = new RoomCollection()
        rooms.fetch(
          success: =>
            roomsView = new RoomCollectionView collection: rooms
            @application.layout.content.show roomsView
        )

    add: =>
        console.log "Executing RoomController.add"
        room = new RoomModel()
        roomAddView = new RoomAddView model : room
        @application.layout.content.show roomAddView
###    add: (room_id) =>
        console.log room_id
        room = new RoomModel()
        room.set({'room_id', room_id})
        room.fetch(
            success: =>
                roomEdit = new RoomEditView(model : room)
                @application.layout.content.show(roomEdit)  
        )
###