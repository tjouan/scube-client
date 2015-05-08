App.Router.map ->
  @route 'authentication', path: '/signin'
  @route 'signout'

  @resource 'playlists'
  @route 'playlists.new', path: '/playlists/new'
  @resource 'playlist', path: '/playlists/:id', ->
    @route 'edit'
