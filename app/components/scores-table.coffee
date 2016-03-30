`import Ember from 'ember'`
`import FieldSorting from 'client/mixins/field-sorting'`

ScoresTableComponent = Ember.Component.extend FieldSorting,
  store: Ember.inject.service()
  selectedScores: Ember.computed.filterBy('scores', 'isSelected', true)
  selectedScoresIsEmpty: Ember.computed 'selectedScores', ->
    @get('selectedScores').get('length') == 0
  actions:
    toggleArchive: ->
      scores = @get('selectedScores')
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, modified: new Date(), isSelected: false } )
          score.save()
      @get('scores').removeObjects(scores)
    delete: () ->
      scores = @get('selectedScores')
      @sendAction('delete', scores)
    info: (score) ->
      @sendAction('info', score)
    attach: (score) ->
      @sendAction('attach', score)

`export default ScoresTableComponent`
