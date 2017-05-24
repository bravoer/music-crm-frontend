import Ember from 'ember'
import DataTableRouteMixin from 'ember-data-table/mixins/route'

export default Ember.Route.extend DataTableRouteMixin,
  modelName: 'musician'
  queryParams:
    filter: { refreshModel: true }
    page: { refreshModel: true }
    size: { refreshModel: true }
    sort: { refreshModel: true }
    group: { refreshModel: true }
  mergeQueryOptions: (params) ->
    {
      include: 'address,telephones,groups'
      'filter[groups][name]' : params.group
    }
