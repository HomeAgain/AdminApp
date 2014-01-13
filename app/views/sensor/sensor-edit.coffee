module.exports = class SensorEdit extends Backbone.Marionette.ItemView
    id : 'sensor-edit'
    template: 'views/templates/sensor/sensor-edit'

    events: 
        'click #update' : 'update'

    # Update and save the model changes
    update: (object) ->
        @form.commit()
        @model.save(
            null,
            success: ->
                console.log('Sensor successfully updated! ')
                Backbone.history.navigate('/sensor/', true)
        )
        
    render: ->
        super
        roomOptions = [{val: 0, label:"Unassigned"}]
        $.getJSON(
            'http://localhost:4000/room/',
            (rooms) =>
                rooms.forEach( (room) ->
                    roomOptions.push({ val: room['_id'], label: room['name'] })
                )
                @model.schema.room_id.options = roomOptions
                @model.schema.model.editorAttrs = { disabled: true }
                
                @form = new Backbone.Form({
                    model: @model
                    })
                @$el.find("#form").html(@form.render().$el)
                
        )