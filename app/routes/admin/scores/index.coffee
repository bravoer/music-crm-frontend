`import Ember from 'ember'`

AdminScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'scores'
  actions:
    deleteScore: (score) ->
      @modelFor('admin.scores.index').removeObject(score)
      @store.deleteResource('scores', score).then =>
        @refresh

`export default AdminScoresIndexRoute`
