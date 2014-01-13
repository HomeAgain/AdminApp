RoomAddForm = require 'views/templates/room/room-add-form'

module.exports = class RoomAdd extends Backbone.Marionette.ItemView
    id : 'room-add'
    template: 'views/templates/room/room-add'

    events:
        'click #add' : 'add'

    add : (object) ->
        @form.commit()
        @model.save null,
            success: (model, response) ->
                console.log('Room added successfully')
                Backbone.history.navigate('/room/', true)
            error: (model, response) ->
                console.log(response)


    render : ->
        super
        @form = new Backbone.Form(
            model: @model
            template: RoomAddForm
        )
        console.log @$el.find("#form")
        @$el.find("#form").html(@form.render().$el)
        @bindUIElements()
        
