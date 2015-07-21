`import Ember from 'ember'`

AdminScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    save: ->
      @transitionTo 'admin.scores.index'
    addPart: (file) ->
      console.log "Add part: " + file.name
      part = @container.lookup('model:parts').create
        attributes: { file: file.name }
      @store.createResource('parts', part).then (resource) =>
        score = @get('controller.model')
        resource.addRelationship('score', score.id)       
        @store.patchRelationship('parts', resource, 'score').then () =>
          @get('controller.model.parts').addObject(resource)

`export default AdminScoresEditRoute`
