`import Ember from 'ember'`

ScoresIndexRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'active'
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true

`export default ScoresIndexRoute`
