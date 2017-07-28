import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.findRecord 'musician', params.id, { include: 'address,telephones,groups' }
