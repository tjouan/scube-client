#= require ./config/environment
#= require_tree ./lib

#= require_self
#= require_tree ./controllers
#= require_tree ./models
#= require ./routes/authentication
#= require_tree ./routes
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./components
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


#App.ApplicationAdapter = DS.ActiveModelAdapter.extend
App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace:  'api'
  host:       Env.baseURI
  headers:    ( ->
    'Authorization': "Token token=#{App.get 'token'}"
  ).property('App.token')
  shouldReloadAll: ->
    false


@?.App = App
