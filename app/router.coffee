App.Router.map ->
  @resource 'playlists'
  @resource 'playlists.new', path: '/playlists/new'
  @resource 'playlist', path: '/playlists/:playlist_id', ->
    @route 'edit'
