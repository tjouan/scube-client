App.AuthenticationController = Ember.Controller.extend
  actions:
    authenticate: ->
      @set 'errorMessage', null
      adapter = @store.adapterFor('application')
      uri     = [adapter.get('host'), adapter.get('namespace'), 'sessions'].join '/'
      params  = session: @getProperties('email', 'password')
      $.post(uri, JSON.stringify(params)).then (response) =>
        App.set 'token', response.session.token
        if transition = @get 'transition'
          transition.retry()
          @set 'transition', null
        else
          @transitionToRoute 'application'
      , (error) =>
        @set 'errorMessage', "Cannot authenticate (#{error.status})"

  revoke: ->
    App.set 'token', null
    @transitionToRoute 'authentication'

  reset: ->
    @setProperties
      email:        ''
      password:     ''
      errorMessage: null
