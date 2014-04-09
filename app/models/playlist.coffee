App.Playlist = DS.Model.extend
  name: DS.attr('string')


App.Playlist.FIXTURES = [
  {
    id:   1
    name: 'electro'
  }
  {
    id:   2
    name: 'rock'
  }
]
