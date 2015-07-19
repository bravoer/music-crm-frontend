`import Ember from 'ember'`

AdminScoresIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'scores'

`export default AdminScoresIndexRoute`
