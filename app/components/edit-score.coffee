`import Ember from 'ember'`

EditScoreComponent = Ember.Component.extend
  actions:
    cancel: ->
      @sendAction('cancel')
    save: ->
      score = @get('score')
      @sendAction('save', score)
    deletePart: (part) ->
      @sendAction('deletePart', part)
      
`export default EditScoreComponent`
