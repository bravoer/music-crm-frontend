import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        size: 1000 # we want all active scores on 1 page
      filter:
        status: 'active'
      sort: 'title'
      include: 'parts'
    }
