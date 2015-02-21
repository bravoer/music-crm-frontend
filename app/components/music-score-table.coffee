`import Ember from 'ember'`

MusicScoreTableComponent = Ember.Component.extend
  didInsertElement: ->
    $('.modal-trigger').leanModal()

  musicScoreModalId: Ember.computed 'elementId', ->
    "##{@get('elementId')} .music-score-modal"

  actions:
    selectScore: (score) ->
      @set 'selectedScore', score
    toggleStatus: (score) ->
      if score.get('isActive')
        score.set('status', 'archived')
      else
        score.set('status', 'active')
      score.save()

`export default MusicScoreTableComponent`
