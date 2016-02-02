`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'score', { status: 'active' }
      
  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    saveScore: (score) ->
      score.save().then () =>
        @transitionTo 'admin.scores.index'

`export default AdminScoresAddRoute`
