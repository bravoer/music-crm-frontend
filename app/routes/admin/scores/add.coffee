`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  model: ->
    @container.lookup('model:scores').create
      isNew: true
      attributes: { status: 'active' }
      
  _resetModel: ->
    score = @container.lookup('model:scores').create
      isNew: true
      attributes: { status: 'active' }
    @get('controller').set('model', score)

  actions:
    cancel: ->
      @_resetModel()
      @transitionTo 'admin.scores.index'
    save: ->
      @store.createResource('scores', @get('controller.model')).then () =>
        @_resetModel()
        @transitionTo 'admin.scores.index'

`export default AdminScoresAddRoute`
