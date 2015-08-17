`import Ember from 'ember'`

EditScoreComponent = Ember.Component.extend
  actions:
    cancel: ->
      @sendAction('cancel')
    addPart: (file) ->
      @sendAction('addPart', file)
    deletePart: (part) ->
      @sendAction('deletePart', part)
      
`export default EditScoreComponent`
