import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.findRecord 'score', params.id
