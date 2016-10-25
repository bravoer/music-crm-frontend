`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  rows: Ember.computed 'scores', 'scores.@each.status', ->
    expectedStatus = if @get('archived') then 'archived' else 'active'
    @get('scores').filterBy('status', expectedStatus)
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  actions:
    toggleArchive: (scores) ->
      scores.setEach('isSelected', false)
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, modified: new Date() } )
          score.save()
    delete: (scores) ->
      scores.setEach('isSelected', false)
      @sendAction('delete', scores)
    info: (score) ->
      @sendAction('info', score)
    attach: (score) ->
      @sendAction('attach', score)

`export default ScoresTableComponent`
