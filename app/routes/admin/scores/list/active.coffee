`import Ember from 'ember'`

AdminScoresListActiveRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'active'
      sort: params.sort
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
    sort:
      refreshModel: true
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('detailModalIsOpen', false)
    controller.set('createPartModalIsOpen', false)

`export default AdminScoresListActiveRoute`
