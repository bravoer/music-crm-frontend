`import Ember from 'ember'`

MainAdminScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'score', params.id
  actions:
    save: () ->
      score = @modelFor('main.admin.scores.edit')
      score.set('modified', new Date())
      score.save().then (score) =>
        @controllerFor('main.admin.scores.edit').set('editMode', false)

`export default MainAdminScoresEditRoute`
