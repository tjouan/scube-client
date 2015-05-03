App.SessionsNewController = Ember.ObjectController.extend
  actions:
    save: ->
      newRecord = @store.createRecord 'session', @get('model')
      newRecord.save()
