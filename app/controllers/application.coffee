App.ApplicationController = Ember.Controller.extend
  isAuthenticated: (->
    App.get 'token'
  ).property('App.token')
