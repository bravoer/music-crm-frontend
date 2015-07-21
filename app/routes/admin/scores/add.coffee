`import Ember from 'ember'`

AdminScoresAddRoute = Ember.Route.extend
  model: ->
    @container.lookup('model:scores').create
      isNew: true
      attributes: { status: 'active' }

  actions:
    resetModel: ->
      score = @container.lookup('model:scores').create
        isNew: true
        attributes: { status: 'active' }
      @get('controller').set('model', score)
      return

`export default AdminScoresAddRoute`
