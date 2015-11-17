`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager, 
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    addPart: (file) ->
      @createFile(file).then (response) =>
        part = @container.lookup('model:parts').create
          attributes: { file: response.links.self, name: file.name }
        @store.createResource('parts', part).then (resource) =>
          resource.set('isEdit', false)
          score = @get('controller.model')
          resource.addRelationship('score', score.id)       
          @store.patchRelationship('parts', resource, 'score').then () =>
            @get('controller.model.parts').addObject(resource)
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.removeRelationship('score', @get('controller.model.id'))
      @store.patchRelationship('parts', part, 'score').then () =>
        @get('controller.model.parts').removeObject(part)
        @store.deleteResource('parts', part)
    toggleEditPart: (part) ->
      part.toggleProperty('isEdit')


`export default AdminScoresEditRoute`
