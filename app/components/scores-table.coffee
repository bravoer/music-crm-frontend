`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  selectedScores: Ember.computed.filterBy('scores', 'isSelected', true)
  selectedScoresCount: Ember.computed 'selectedScores', ->
    @get('selectedScores.length')
  selectedScoresIsEmpty: Ember.computed 'selectedScoresCount', ->
    @get('selectedScoresCount') == 0
  actions:
    toggleArchive: ->
      scores = @get('selectedScores')
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, modified: new Date(), isSelected: false } )
          score.save()
      @get('scores').removeObjects(scores)
    clearSelection: ->
      @get('selectedScores').forEach (s) -> s.set('isSelected', false) 
    delete: () ->
      scores = @get('selectedScores')
      @sendAction('delete', scores)
    info: (score) ->
      @sendAction('info', score)
    attach: (score) ->
      @sendAction('attach', score)

`export default ScoresTableComponent`
