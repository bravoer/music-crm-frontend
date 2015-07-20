`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  controllerName: 'admin/scores/edit'
  templateName: 'admin/scores/edit'
  model: ->
    @container.lookup('model:scores').create
      isNew: true
      attributes: { status: 'active' }

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set 'addedParts', []
    controller.set 'deletedParts', []
  actions:
    resetModel: ->
      score = @container.lookup('model:scores').create
        isNew: true
        attributes: { status: 'active' }
      @get('controller').set('model', score)
      return

`export default AdminScoresAddRoute`
