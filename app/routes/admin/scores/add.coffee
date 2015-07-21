`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  model: ->
    @container.lookup('model:scores').create
      isNew: true
      attributes: { status: 'active' }

  actions:
    _resetModel: ->
      score = @container.lookup('model:scores').create
        isNew: true
        attributes: { status: 'active' }
      @get('controller').set('model', score)
    cancel: ->
      @_resetModel()
      @transitionTo 'admin.scores.index'
    save: ->
      @store.createResource('scores', @get('model')).then () =>
        @_resetModel()
        @transitionTo 'admin.scores.index'

`export default AdminScoresAddRoute`
