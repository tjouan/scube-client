App.SessionsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @store.createRecord('session', @get 'model').save()
