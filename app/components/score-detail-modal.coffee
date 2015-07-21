`import Ember from 'ember'`

ScoreDetailModalComponent = Ember.Component.extend
  actions:
    close: ->
      @set 'isOpen', false
      return false

`export default ScoreDetailModalComponent`
