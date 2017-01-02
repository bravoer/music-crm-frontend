`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  # add this dummy filter such that view gets updated if an item's status changes / is deleted
  filteredScores: Ember.computed 'scores.[]', 'scores.@each.status', () ->
    scores = @get('scores').filterBy('status', @get('status'))
    scores.meta = @get('scores.meta')
    scores
  actions:
    toggleArchive: (scores, datatable) ->
      datatable.clearSelection()
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, modified: new Date() } )
          score.save()
    delete: (scores, datatable) ->
      datatable.clearSelection()
      scores.forEach (score) ->
        score.destroyRecord()

`export default ScoresTableComponent`
