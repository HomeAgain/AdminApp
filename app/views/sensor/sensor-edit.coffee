module.exports = class SensorEdit extends Backbone.Marionette.ItemView
    id : 'sensor-edit'
    template: 'views/templates/sensor/sensor-edit'

    render: ->
        super
        _sensor = @model
        console.log _sensor
        _form = @$el.find("#canvas").get(0)
        roomOptions = [{val: 0, label:"Unassigned"}]
        $.getJSON(
            'http://localhost:4000/room/',
            (rooms) ->
                rooms.forEach( (room) ->
                    roomOptions.push({ val: room['_id'], label: room['name'] })
                )
                _sensor.schema.room_id.options = roomOptions
                _sensor.schema.model.editorAttrs = { disabled: true }
                
                form = new Backbone.Form({
                    model: _sensor
                    })
                _form.html(form.render().$el)
                ###$("#update").click( (object) ->
                    form.commit()
                    sensor.save(
                        null,
                        success: ->
                            console.log('Sensor successfully updated! ')
                            Backbone.history.navigate('/admin/sensors/', true)
                    )
                )###
        )