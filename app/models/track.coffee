App.Track = DS.Model.extend
  name: DS.attr('string')


App.Track.FIXTURES = [
  {
    id:   1
    name: 'some song'
  }
  {
    id:   2
    name: 'another song'
  }
]
