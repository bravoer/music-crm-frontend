import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.findRecord 'event', params.id, { include: 'helpers' }
