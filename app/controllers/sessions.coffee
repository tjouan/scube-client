App.SessionsNewController = Ember.Controller.extend
  actions:
    save: ->
      @store.createRecord('session', @get 'model').save().then =>
        @transitionToRoute 'application'
