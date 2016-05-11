`import Ember from 'ember'`

EditScoreComponent = Ember.Component.extend
  actions:
    cancel: ->
      score = @get('score')
      @sendAction('cancel', score)
    save: ->
      score = @get('score')
      @sendAction('save', score)
    deletePart: (part) ->
      @sendAction('deletePart', part)
    downloadPart: (part) ->
      @sendAction('downloadPart', part)
      
`export default EditScoreComponent`
