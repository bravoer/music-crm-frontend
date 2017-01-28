`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

AdminMusiciansIndexRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'musician'
  mergeQueryOptions: (params) ->
    {
      include: 'address,telephones'
    }

`export default AdminMusiciansIndexRoute`
