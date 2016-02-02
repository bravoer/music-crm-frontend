`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager, 
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    saveScore: (score) ->
      score.save().then () =>
        @transitionTo 'admin.scores.index'
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.save().then (part) ->
        part.destroyRecord()

`export default AdminScoresEditRoute`
