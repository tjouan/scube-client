App.PlaylistController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @get('model').deleteRecord()
      @get('model').save()
      @transitionToRoute 'playlists'


App.PlaylistsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      newRecord = @store.createRecord('playlist', @get('model'))
      newRecord.save()
      @transitionToRoute 'playlist', newRecord


App.PlaylistController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @get('model').deleteRecord()
      @get('model').save()
      @transitionToRoute 'playlists'


App.PlaylistEditController = Ember.ObjectController.extend
  actions:
    save: ->
      playlist = @get 'model'
      playlist.save()
      @transitionToRoute 'playlist'
