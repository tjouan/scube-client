App.Router.map ->
  @resource 'sessions', ->
    @route 'new'

  @resource 'playlists'
  @route 'playlists.new', path: '/playlists/new'
  @resource 'playlist', path: '/playlists/:playlist_id', ->
    @route 'edit'

  @resource 'tracks'
  @resource 'tracks.new', path: '/tracks/new'
  @resource 'track', path: '/tracks/:track_id', ->
    @route 'edit'
