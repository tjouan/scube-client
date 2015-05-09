App.PlaylistsController = Ember.ArrayController.extend
  sortProperties: ['name']

  playlists: ( ->
    if @get 'search' then @get 'searchedPlaylists' else @
  ).property('search', 'searchedPlaylists')

  searchedPlaylists: ( ->
    search = @get('search').toLowerCase()
    @filter (playlist) => playlist.get('name').toLowerCase().indexOf(search) isnt -1
  ).property('search', '@each.name')


App.PlaylistController = Ember.Controller.extend
  actions:
    destroy: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'playlists'


App.PlaylistsNewController = Ember.Controller.extend
  actions:
    save: ->
      @store.createRecord('playlist', @get 'model').save()
      @transitionToRoute 'playlists'

    cancel: ->
      @transitionToRoute 'playlists'


App.PlaylistEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save()
      @transitionToRoute 'playlists'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'playlist'
