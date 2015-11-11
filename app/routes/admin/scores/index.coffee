`import Ember from 'ember'`

AdminScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'scores'
  actions:
    deleteScores: (scores) ->
      promises = []
      scores.forEach (score) =>
        promises.push(@store.deleteResource('scores', score))
      Promise.all(promises).then =>
        @modelFor('admin.scores.index').removeObjects(scores)

`export default AdminScoresIndexRoute`
