App.TracksRoute = Ember.Route.extend
  model: ->
    @store.find 'track'


App.TracksNewRoute = Ember.Route.extend
  model: ->
    Em.Map.create({})

  renderTemplate: ->
    @render 'track.edit', controller: 'tracksNew'
