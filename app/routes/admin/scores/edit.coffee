`import Ember from 'ember'`

AdminScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    save: ->
      @transitionTo 'admin.scores.index'
          
`export default AdminScoresEditRoute`
