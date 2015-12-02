`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager, 
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.removeRelationship('score', @get('controller.model.id'))
      @store.patchRelationship('parts', part, 'score').then () =>
        @get('controller.model.parts').removeObject(part)
        @store.deleteResource('parts', part)

`export default AdminScoresEditRoute`
