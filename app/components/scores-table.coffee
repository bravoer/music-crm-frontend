import Ember from 'ember'

export default Ember.Component.extend
  actions:
    changeStatuses: (selection, datatable, status) ->
      datatable.clearSelection()
      Promise.all(selection.filter( (score) -> score.get('status') != status).map (score) =>
        score.setProperties( { status: status, modified: new Date() })
        score.save()
      ).then (scores) =>
        @get('refreshModel')() if scores && scores.length > 0
    createScore: ->
      console.log('Score must be created here');
    deleteScores: (selection, datatable) ->
      datatable.clearSelection()
      Promise.all(selection.map (score) -> score.destroyRecord()).then () =>
        @get('refreshModel')()
    updateStatusFilter: (status) ->
      @set('status', status)
      @set('page', 0)
