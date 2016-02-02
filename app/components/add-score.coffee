`import Ember from 'ember'`

AddScoreComponent = Ember.Component.extend
  actions:
    save: ->
      score = @get('score')
      @sendAction('save', score)
    cancel: ->
      @sendAction('cancel')

`export default AddScoreComponent`
