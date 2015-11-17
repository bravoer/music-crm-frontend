`import Ember from 'ember'`

ScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find('scores').then (scores) ->
      scores.filterBy('status', 'active')

`export default ScoresIndexRoute`
