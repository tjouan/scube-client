App.PlaylistsRoute = Ember.Route.extend
  model: ->
    @store.find 'playlist'


App.PlaylistsNewRoute = Ember.Route.extend
  model: ->
    Em.Map.create({})

  renderTemplate: ->
    @render 'playlist.edit', controller: 'playlistsNew'
