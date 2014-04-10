App.TrackController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @get('model').deleteRecord()
      @get('model').save()
      @transitionToRoute 'tracks'


App.TracksNewController = Ember.ObjectController.extend
  actions:
    save: ->
      newRecord = @store.createRecord('track', @get('model'))
      newRecord.save()
      @transitionToRoute 'track', newRecord


App.TrackController = Ember.ObjectController.extend
  actions:
    destroy: ->
      @get('model').deleteRecord()
      @get('model').save()
      @transitionToRoute 'tracks'


App.TrackEditController = Ember.ObjectController.extend
  actions:
    save: ->
      model = @get 'model'
      model.save()
      @transitionToRoute 'track'
