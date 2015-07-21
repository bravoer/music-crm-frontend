`import Ember from 'ember'`

AdminScoresEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'scores', params.id

  actions:
    cancel: ->
      @transitionTo 'admin.scores.index'
    save: ->
      if @get('model.changedAttributes')
        @store.updateResource('scores', @get('model')).then () =>
          @transitionTo 'admin.scores.index'
      else
        @transitionTo 'admin.scores.index'
          
`export default AdminScoresEditRoute`
