`import Ember from 'ember'`

AdminScoresListRoute = Ember.Route.extend
  modelName: 'score'
  queryParams: {
    filter: { refreshModel: true }
    page: { refreshModel: true }
    size: { refreshModel: true }
    sort: { refreshModel: true }
  }
  model: (params) ->
    # TODO: replace with mergedQueryOptions when it becomes a function
    @set('params', params)
    options =
      sort: params.sort
      page:
        number: params.page
        size: params.size
      'filter[status]': params.status
      include: 'parts'
    # TODO: sending an empty filter param to backend returns []
    options.filter = params.filter if params.filter
    @store.query('score', options)
  setupController: (controller, model) ->
    @_super(controller, model)
    # TODO: retrieve status value from model meta when self parsing is implemented
    controller.set('status', @get('params.status'))

`export default AdminScoresListRoute`
