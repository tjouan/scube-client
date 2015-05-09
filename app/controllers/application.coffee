App.ApplicationController = Ember.Controller.extend
  actions:
    signout: ->
      @controllerFor('authentication').revoke()

  isAuthenticated: (->
    App.get 'token'
  ).property('App.token')
