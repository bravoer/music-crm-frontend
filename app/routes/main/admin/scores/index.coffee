import Ember from 'ember'
import DataTableRouteMixin from 'ember-data-table/mixins/route'

export default Ember.Route.extend DataTableRouteMixin,
  modelName: 'score'
  queryParams:
    filter: { refreshModel: true }
    page: { refreshModel: true },
    size: { refreshModel: true },
    sort: { refreshModel: true },
    status: { refreshModel: true }
  mergeQueryOptions: (params) ->
    'filter[status]': params.status
  actions:
    refreshModel: () ->
      @refresh()
