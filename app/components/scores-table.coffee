`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  selectedScores: Ember.computed.filterBy('scores', 'isSelected', true)
  selectionIsEmpty: Ember.computed 'scores.@each.isSelected', ->
    @get('scores').filterBy('isSelected', true).get('length') == 0
  actions:
    toggleArchive: ->
      scores = @get('selectedScores')
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, isSelected: false } )
    delete: () ->
      scores = @get('selectedScores')
      @sendAction('delete', scores)
    openDetail: (score) ->
      @set('selectedScore', score)
      @set('detailIsOpen', true)
    openNewMusicPart: (score) ->
      musicPart = @container.lookup('model:parts').create()
      @set('selectedScore', score)
      @set('newMusicPart', musicPart)
      @set('newMusicPartIsOpen', true)
    addFile: (file, part) ->
      @sendAction('addFile', file, part)
    savePart: (score, part) ->
      @sendAction('savePart', score, part)
    deletePart: (score, part) ->
      @sendAction('deletePart', score, part)

`export default ScoresTableComponent`
