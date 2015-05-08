App.Router.map ->
  @route 'sessions.new', path: '/signin'

  @resource 'playlists'
  @route 'playlists.new', path: '/playlists/new'
  @resource 'playlist', path: '/playlists/:id', ->
    @route 'edit'
