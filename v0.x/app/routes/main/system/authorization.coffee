import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    users: @store.query 'user', {
      page:
        size: 1000
      sort: 'name'
    }
