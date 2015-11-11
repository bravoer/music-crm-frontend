`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  selectedScores: Ember.computed.filterBy('scores', 'isSelected', true)
  selectionIsEmpty: Ember.computed 'scores.@each.isSelected', ->
    @get('scores').filterBy('isSelected', true).get('length') == 0
  actions:
    toggleArchive: ->
      scores = @get('selectedScores')
      scores.forEach (score) ->
        toggledStatus = if score.get('isActive') then 'archived' else 'active'
        score.set('status', toggledStatus)
        score.set('isSelected', false)
    delete: () ->
      scores = @get('selectedScores')
      @sendAction('delete', scores)
    openDetail: (score) ->
      @set('selectedScore', score)
      @set('detailIsOpen', true)

`export default ScoresTableComponent`
