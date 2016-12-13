`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'score', { status: 'active' }
  actions:
    cancel: () ->
      score = @modelFor('main.admin.scores.add')
      status = score.get('status')
      score.rollbackAttributes()
      @transitionTo 'main.admin.scores.index', status
    save: () ->
      score = @modelFor('main.admin.scores.add')
      score.set('modified', new Date())
      score.save().then (score) =>
        @transitionTo 'main.admin.scores.index', score.get('status')

`export default AdminScoresAddRoute`
