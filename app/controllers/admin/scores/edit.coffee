`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditController = Ember.Controller.extend FileManager,
  actions:
    cancel: ->
      @transitionToRoute 'admin.scores.index'
    save: ->
      @store.updateResource('scores', @get('model')).then () =>
        @transitionToRoute 'admin.scores.index'

`export default AdminScoresEditController`
