`import Ember from 'ember'`

AddScoreComponent = Ember.Component.extend
  actions:
    save: ->
      score = @get('score')
      @sendAction('save', score)
    cancel: ->
      score = @get('score')
      @sendAction('cancel', score)

`export default AddScoreComponent`
