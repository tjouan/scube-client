#= require jquery/jquery-2.1.0
#= require ember/ember-1.11.1
#= require ember/ember-data-1.0.0-beta.16.1

#= require ./config/environment

#= require_self
#= require_tree ./controllers
#= require_tree ./lib
#= require_tree ./models
#= require_tree ./routes
#= require_tree ./templates
#= require_tree ./views
#= require ./router


App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true


App.Router.reopen
  location: 'auto'


#App.ApplicationAdapter = DS.ActiveModelAdapter.extend
App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace:  'api'
  host:       Env.baseURI


@?.App = App
