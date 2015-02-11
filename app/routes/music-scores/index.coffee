`import Ember from 'ember'`

MusicScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'music-score', { status: 'active' }

`export default MusicScoresIndexRoute`
