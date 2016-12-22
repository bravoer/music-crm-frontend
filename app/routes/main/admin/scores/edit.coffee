`import Ember from 'ember'`

AdminScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'score', params.id
  actions:
    save: () ->
      score = @modelFor('main.admin.scores.edit')
      score.set('modified', new Date())
      score.save().then (score) =>
        @transitionTo 'main.admin.scores.index', score.get('status')

`export default AdminScoresEditRoute`
