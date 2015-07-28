`import Ember from 'ember'`

ScoresIndexRoute = Ember.Route.extend
  model: ->
     @store.find 'scores'

`export default ScoresIndexRoute`
