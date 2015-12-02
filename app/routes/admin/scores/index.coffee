`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresIndexRoute = Ember.Route.extend FileManager,
  model: ->
    @store.find 'scores'
  actions:
    addFile: (file, part) ->
      console.log 'add file action in edit route'
      @createFile(file).then (response) =>
        part.set('file', response.links.self)
        part.set('name', file.name)
    savePart: (score, part) ->
      console.log 'save part action in edit route'
      @store.createResource('parts', part).then (resource) =>
        resource.addRelationship('score', score.id)       
        @store.patchRelationship('parts', resource, 'score').then () =>
          console.log 'part added to score'
          @get('controller.model').findBy('id', score.id).get('parts').addObject(resource)
          # @get('controller.model.parts').addObject(resource)
    deleteScores: (scores) ->
      promises = []
      scores.forEach (score) =>
        promises.push(@store.deleteResource('scores', score))
      Promise.all(promises).then =>
        @modelFor('admin.scores.index').removeObjects(scores)
    deletePart: (score, part) ->
      @deleteFile(part.get('file'))
      part.removeRelationship('score', score.id)
      @store.patchRelationship('parts', part, 'score').then () =>
        @get('controller.model').findBy('id', score.id).get('parts').removeObject(part)
        @store.deleteResource('parts', part)

`export default AdminScoresIndexRoute`
