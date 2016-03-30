`import Ember from 'ember'`

AdminScoresListActiveRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'active'
      sort: 'title'
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('detailModalIsOpen', false)
    controller.set('createPartModalIsOpen', false)

`export default AdminScoresListActiveRoute`
