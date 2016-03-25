`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
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
          score.setProperties( { status: toggledStatus, isSelected: false } )
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
