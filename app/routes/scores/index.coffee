`import Ember from 'ember'`

ScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('score').then (scores) ->
      scores.filterBy('status', 'active')

`export default ScoresIndexRoute`
