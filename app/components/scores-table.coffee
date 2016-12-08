`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  status: Ember.computed.readOnly 'archived', ->
    if @get('archived') then 'archived' else 'active'
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  # add this dummy filter such that view gets updated if an item's status changes / is deleted
  filteredScores: Ember.computed 'scores.[]', 'scores.@each.isArchived', () ->
    @get('scores').filterBy('isArchived', @get('archived'))
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
      scores.forEach (score) =>
        score.destroyRecord()
    info: (score) ->
      @sendAction('info', score)
    attach: (score) ->
      @sendAction('attach', score)

`export default ScoresTableComponent`
