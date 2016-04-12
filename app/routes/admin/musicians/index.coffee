`import Ember from 'ember'`

AdminMusiciansIndexRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'musician', {
      page:
        number: params.page
        size: params.size
      sort: params.sort
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
    sort:
      refreshModel: true

`export default AdminMusiciansIndexRoute`
