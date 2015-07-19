`import Ember from 'ember'`

AdminMusicScoresAddRoute = Ember.Route.extend
  controllerName: 'admin/music-scores/edit'
  templateName: 'admin/music-scores/edit'
  model: ->
    @store.createRecord 'music-score',
      status: 'active'
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set 'addedParts', []
    controller.set 'deletedParts', []

`export default AdminMusicScoresAddRoute`
