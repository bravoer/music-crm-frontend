import Ember from 'ember'

export default Ember.Component.extend
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  # add this dummy filter such that view gets updated if an item's status changes / is deleted
  filteredScores: Ember.computed 'scores.[]', 'scores.@each.status', () ->
    if (@get('status') != 'all')
      scores = @get('scores').filterBy('status', @get('status'))
    else
      # dummy filter to make sure we return the same kind of object (not a promise) as the if-clause
      scores = @get('scores').filterBy('title')
    scores.meta = @get('scores.meta')
    scores
  actions:
    changeStatus: (scores, datatable, status) ->
      datatable.clearSelection()
      Ember.changeProperties () ->
        scores.forEach (score) ->
          score.setProperties( { status: status, modified: new Date() } )
          score.save()
    delete: (scores, datatable) ->
      datatable.clearSelection()
      scores.forEach (score) ->
        score.destroyRecord()
