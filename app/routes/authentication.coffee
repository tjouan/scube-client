App.AuthenticatedRoute = Ember.Route.extend
  actions:
    error: (reason, transition) ->
      if reason.status is 401
        @controllerFor('authentication').set 'transition', transition
        @transitionTo 'authentication'


App.AuthenticationRoute = Ember.Route.extend
  setupController: (controller, _context) ->
    controller.reset()
