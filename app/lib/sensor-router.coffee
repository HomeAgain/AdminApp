application = require 'application'

SensorController = require 'controllers/sensor-controller'

module.exports = class SensorRouter extends Marionette.AppRouter
  controller: new SensorController(application : application)
  appRoutes: 
    'sensor(/)': 'index'
    'sensor/edit/:sensor_id(/)': 'edit'


###module.exports = class SensorRouter extends Backbone.Router

	routes:
    '': 'sensor'
    'sensor': 'sensor'
    'sensor/edit/:sensor_id' : 'editSensor'
    'room': 'room'


  admin: =>
    console.log "This is the admin page"
    view = new SigninView()
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'signin'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
      )

  loading: =>
    loadingView = new LoadingView()
    application.layout.content.show(loadingView)

  sensor: =>
    @loading()
    sensors = new SensorCollection()
    sensors.fetch(
      success: ->
        sensorsView = new SensorCollectionView({collection: sensors})
        application.layout.content.show(sensorsView)
    )

  room: ->
    @loading()
    rooms = new RoomCollection()
    rooms.fetch(
      success: ->
        roomsView = new RoomCollectionView({collection: rooms})
        application.layout.content.show(roomsView)
    )


###