import Ember from 'ember'
import { CanMixin } from 'ember-can'

export default Ember.Route.extend CanMixin,
  beforeModel: ->
    @transitionTo('index') unless @can 'read score'
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'active'
      sort: params.sort
      include: 'parts'
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
    sort:
      refreshModel: true
