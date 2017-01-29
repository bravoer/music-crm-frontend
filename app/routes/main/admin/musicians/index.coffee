`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

MainAdminMusiciansIndexRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'musician'
  mergeQueryOptions: (params) ->
    {
      include: 'address,telephones,groups'
    }

`export default MainAdminMusiciansIndexRoute`
