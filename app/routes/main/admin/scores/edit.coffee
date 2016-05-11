`import Ember from 'ember'`
`import ScoreActions from 'client/mixins/score-actions'`
`import PartActions from 'client/mixins/part-actions'`

AdminScoresEditRoute = Ember.Route.extend ScoreActions, PartActions,
  model: (params) ->
    @store.findRecord 'score', params.id

`export default AdminScoresEditRoute`
