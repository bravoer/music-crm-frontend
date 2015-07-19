`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  actions:
    toggleStatus: (status) ->
      console.log status

`export default ScoresTableComponent`
