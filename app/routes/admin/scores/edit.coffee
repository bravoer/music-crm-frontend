`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager, 
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    save: ->
      @transitionTo 'admin.scores.index'
    addPart: (file) ->
      console.log "Add part: " + file.name
      @createFile(file).then (url) =>
        part = @container.lookup('model:parts').create
          attributes: { file: url }
        @store.createResource('parts', part).then (resource) =>
          score = @get('controller.model')
          resource.addRelationship('score', score.id)       
          @store.patchRelationship('parts', resource, 'score').then () =>
            @get('controller.model.parts').addObject(resource)
    deletePart: (part) ->
      console.log "Remove part: " + part.id
      part.removeRelationship('score', @get('controller.model.id'))
      @store.patchRelationship('parts', part, 'score').then () =>
        @get('controller.model.parts').removeObject(part)
        @store.deleteResource('parts', part)


`export default AdminScoresEditRoute`
