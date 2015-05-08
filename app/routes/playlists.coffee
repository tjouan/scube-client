App.PlaylistsRoute = Ember.Route.extend
  model: ->
    @store.find 'playlist'


App.PlaylistsNewRoute = Ember.Route.extend
  model: ->
    Em.Map.create({})


App.PlaylistEditRoute = Ember.Route.extend
  activate:   -> @controllerFor('playlist').set 'isEditing', true
  deactivate: -> @controllerFor('playlist').set 'isEditing', false
