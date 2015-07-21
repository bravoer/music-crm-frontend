`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  actions:
    toggleStatus: (status) ->
      console.log status
    delete: (score) ->
      @sendAction('delete', score)

`export default ScoresTableComponent`
