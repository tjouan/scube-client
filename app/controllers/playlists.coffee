App.PlaylistController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @get('model').destroyRecord()
      @transitionToRoute 'playlists'


App.PlaylistsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @store.createRecord('playlist', @get 'model').save()
      @transitionToRoute 'playlists'


App.PlaylistEditController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save()
      @transitionToRoute 'playlists'
