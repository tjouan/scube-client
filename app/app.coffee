#= require ./config/environment
#= require_tree ./lib

#= require_self
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./routes
#= require_tree ./templates
#= require_tree ./views
#= require ./router


App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true


App.token = localStorage.token
App.addObserver 'token', ->
  localStorage.token = @get 'token'


App.Router.reopen
  location: 'auto'


App.AuthenticatedRoute = Ember.Route.extend
  actions:
    error: (reason, transition) ->
      if reason.status is 401
        @controllerFor('authentication').set 'transition', transition
        @transitionTo 'authentication'


#App.ApplicationAdapter = DS.ActiveModelAdapter.extend
App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace:  'api'
  host:       Env.baseURI
  headers:    ( ->
    'Authorization': "Token token=#{App.get 'token'}"
  ).property('App.token')


@?.App = App
