`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

AdminScoresListArchiveRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'score'
  mergedQueryOptions:
    'filter[status]': 'archived'
    include: 'parts'
  setupController: (controller, model) ->
    @_super(controller, model)
    @controllerFor('main.admin.scores.list').set('activeTab', 'archive')
    controller.set('detailModalIsOpen', false)
    controller.set('createPartModalIsOpen', false)

`export default AdminScoresListArchiveRoute`
