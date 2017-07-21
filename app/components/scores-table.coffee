import Ember from 'ember'

export default Ember.Component.extend
  actions:
    changeStatuses: (selection, datatable) ->
      console.log('Change status here');
    createScore: ->
      console.log('Score must be created here');
    deleteScores: (selection, datatable) ->
      console.log('Scores must be deleted here');
    updateStatusFilter: (status) ->
      @set('status', status)
      @set('page', 0)
