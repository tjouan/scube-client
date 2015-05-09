App.PlaylistsRoute = App.AuthenticatedRoute.extend
  model: ->
    @store.find 'playlist'


App.PlaylistRoute = App.AuthenticatedRoute.extend
  model: (params) -> @store.find 'playlist', params.id


App.PlaylistsNewRoute = App.AuthenticatedRoute.extend
  model: ->
    Em.Map.create({})


App.PlaylistEditRoute = App.AuthenticatedRoute.extend
  activate:   -> @controllerFor('playlist').set 'isEditing', true
  deactivate: -> @controllerFor('playlist').set 'isEditing', false
