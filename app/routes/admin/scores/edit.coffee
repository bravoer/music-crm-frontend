`import Ember from 'ember'`

AdminMusicScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'music-score', params.id
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set 'addedParts', []
    controller.set 'deletedParts', []
      
`export default AdminMusicScoresEditRoute`
