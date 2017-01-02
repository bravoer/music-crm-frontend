`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

AdminScoresListRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'score'
  queryParams: {
    filter: { refreshModel: true }
    page: { refreshModel: true }
    size: { refreshModel: true }
    sort: { refreshModel: true }
  }
  mergeQueryOptions: (params) ->
    @set('params', params) # params need to be available in setupController
    {
      'filter[status]': params.status
      include: 'parts'
    }
  setupController: (controller, model) ->
    @_super(controller, model)
    # TODO: retrieve status value from model meta when self parsing is implemented
    controller.set('status', @get('params.status'))

`export default AdminScoresListRoute`
