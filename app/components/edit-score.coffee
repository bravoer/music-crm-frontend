`import Ember from 'ember'`

EditScoreComponent = Ember.Component.extend
  actions:
    cancel: ->
      @sendAction('cancel')
    deletePart: (part) ->
      @sendAction('deletePart', part)
      
`export default EditScoreComponent`
