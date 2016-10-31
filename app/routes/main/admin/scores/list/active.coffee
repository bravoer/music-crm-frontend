`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

AdminScoresListActiveRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'score'
  mergedQueryOptions:
    filter:
      status: 'active'
    include: 'parts'
  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('detailModalIsOpen', false)
    controller.set('createPartModalIsOpen', false)

`export default AdminScoresListActiveRoute`
