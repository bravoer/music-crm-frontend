`import Ember from 'ember'`
`import ScoreActions from 'client/mixins/score-actions'`

AdminScoresAddRoute = Ember.Route.extend ScoreActions,
  model: ->
    @store.createRecord 'score', { status: 'active' }
      
`export default AdminScoresAddRoute`
