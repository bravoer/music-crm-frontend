`import Ember from 'ember'`

AdminMusicScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'music-score', params.id

`export default AdminMusicScoresEditRoute`
