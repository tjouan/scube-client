App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    if not App.get 'token'
      @transitionToAuthentication transition

  actions:
    error: (reason, transition) ->
      if reason.status is 401
        @transitionToAuthentication transition

  transitionToAuthentication: (transition) ->
    return if transition.targetName is 'authentication'
    @controllerFor('authentication').set 'transition', transition
    @transitionTo 'authentication'


App.AuthenticationRoute = Ember.Route.extend
  setupController: (controller, _context) ->
    controller.reset()
