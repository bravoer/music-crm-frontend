`import Ember from 'ember'`

AddScoreComponent = Ember.Component.extend
  actions:
    save: ->
      @sendAction('save')
    cancel: ->
      @sendAction('cancel')

`export default AddScoreComponent`
