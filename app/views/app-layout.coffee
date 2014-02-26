application = require 'application'

module.exports = class AppLayout extends Backbone.Marionette.Layout
  template: 'views/templates/app-layout'

  regions:
    content: "#content"
    footer: "#footer"

