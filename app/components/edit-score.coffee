`import Ember from 'ember'`

EditScoreComponent = Ember.Component.extend
  actions:
    cancel: ->
      @sendAction('cancel')
    addFile: (file, part) ->
      @sendAction('addFile', file, part)
    savePart: (part) ->
      @sendAction('savePart', part)
    deletePart: (part) ->
      @sendAction('deletePart', part)
    openNewMusicPart: ->
      musicPart = @container.lookup('model:parts').create()
      @set('newMusicPart', musicPart)
      @set('newMusicPartIsOpen', true)
      
`export default EditScoreComponent`
