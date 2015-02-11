`import Ember from 'ember'`

AdminMusicScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'music-score'

`export default AdminMusicScoresIndexRoute`
