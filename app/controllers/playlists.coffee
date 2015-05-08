App.PlaylistsController = Ember.ArrayController.extend
  sortProperties: ['name']

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


App.PlaylistEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save()
      @transitionToRoute 'playlists'
