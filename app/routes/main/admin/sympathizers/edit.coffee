import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.findRecord 'sympathizer', params.id, { include: 'address,telephones' }
