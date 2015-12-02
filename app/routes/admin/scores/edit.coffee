`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager, 
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    addFile: (file, part) ->
      console.log 'add file action in edit route'
      @createFile(file).then (response) =>
        part.set('file', response.links.self)
        part.set('name', file.name)
    savePart: (part) ->
      console.log 'save part action in edit route'
      @store.createResource('parts', part).then (resource) =>
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

`export default AdminScoresEditRoute`
