App.AuthenticationController = Ember.Controller.extend
  token: null

  actions:
    authenticate: ->
      adapter = @store.adapterFor('application')
      uri     = [adapter.get('host'), adapter.get('namespace'), 'sessions'].join '/'
      params  = session: @getProperties('email', 'password')
      $.post(uri, JSON.stringify(params)).then (response) =>
        @set 'token', response.session.token
        Ember.$.ajaxPrefilter (options, oldOptions, jqXHR) ->
          jqXHR.setRequestHeader 'Authorization', "Token token=#{response.session.token}"
        @transitionToRoute 'application'
      , (error) =>
        @set 'errorMessage', "Cannot authenticate (#{error.status})"
