`import Ember from 'ember'`

ScoreDetailModalComponent = Ember.Component.extend
  actions:
    close: ->
      @set 'isOpen', false
      return false
    deletePart: (part) ->
      @sendAction('deletePart', part)
    downloadPart: (part) ->
      @sendAction('downloadPart', part)
  
`export default ScoreDetailModalComponent`
