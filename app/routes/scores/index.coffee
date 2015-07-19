`import Ember from 'ember'`

MusicScoresIndexRoute = Ember.Route.extend
  model: ->
     @store.find 'scores'

`export default MusicScoresIndexRoute`
