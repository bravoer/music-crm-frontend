`import Ember from 'ember'`

AdminScoresListArchiveRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'archived'
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true

`export default AdminScoresListArchiveRoute`
