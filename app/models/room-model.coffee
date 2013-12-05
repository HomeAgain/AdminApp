module.exports = class RoomModel extends Backbone.Model
    urlRoot: 'http://localhost:4000/room/'
    idAttribute: 'room_id'
    
    defaults :
        name: 'MyRoom'
    schema:
        name: 'Text'