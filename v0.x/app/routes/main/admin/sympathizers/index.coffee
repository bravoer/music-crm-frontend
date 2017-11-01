import Ember from 'ember'
import DataTableRouteMixin from 'ember-data-table/mixins/route'

export default Ember.Route.extend DataTableRouteMixin,
  modelName: 'sympathizer'
  mergeQueryOptions: (params) ->
    {
      include: 'address,telephones'
    }
