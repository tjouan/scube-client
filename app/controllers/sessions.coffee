App.SessionsNewController = Ember.Controller.extend
  actions:
    save: ->
      @store.createRecord('session', @get 'model').save().then =>
        @transitionToRoute 'application'
      , (error) =>
        if error.status is 404
          @set 'authFailure', 'Authentication failed'
