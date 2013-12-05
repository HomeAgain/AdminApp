RoomModel = require('models/room-model');

module.exports = class RoomCollection extends Backbone.Collection
    url: 'http://127.0.0.1:4000/room/'
    model : RoomModel
