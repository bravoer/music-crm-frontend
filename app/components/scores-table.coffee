`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  status: Ember.computed.readOnly 'archived', ->
    if @get('archived') then 'archived' else 'active'
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
