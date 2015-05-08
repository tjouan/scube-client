App.AuthenticationController = Ember.Controller.extend
  actions:
    authenticate: ->
      adapter = @store.adapterFor('application')
      uri     = [adapter.get('host'), adapter.get('namespace'), 'sessions'].join '/'
      params  = session: @getProperties('email', 'password')
      $.post(uri, JSON.stringify(params)).then (response) =>
        App.set 'token', response.session.token
        @transitionToRoute 'application'
      , (error) =>
        @set 'errorMessage', "Cannot authenticate (#{error.status})"
