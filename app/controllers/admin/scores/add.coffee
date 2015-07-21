`import Ember from 'ember'`

AdminScoresAddController = Ember.Controller.extend
  actions:
    cancel: ->
      @send('resetModel')
      @transitionToRoute 'admin.scores.index'
    save: ->
      @store.createResource('scores', @get('model')).then () =>
        @send('resetModel')
        @transitionToRoute 'admin.scores.index'

`export default AdminScoresAddController`
