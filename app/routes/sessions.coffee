App.SessionsNewRoute = Ember.Route.extend
  model: ->
    Em.Map.create({})

  setupController: (controller) ->
    controller.set 'authFailure', null
