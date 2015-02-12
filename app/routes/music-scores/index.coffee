`import Ember from 'ember'`

MusicScoresIndexRoute = Ember.Route.extend
  model: ->
#    @store.find 'music-score', { status: 'active' }
     @store.find 'music-score'

`export default MusicScoresIndexRoute`
