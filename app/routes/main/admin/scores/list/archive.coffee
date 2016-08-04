`import Ember from 'ember'`

AdminScoresListArchiveRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'score', {
      page:
        number: params.page
        size: params.size
      filter:
        status: 'archived'
      sort: params.sort
      include: 'parts'
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
    sort:
      refreshModel: true    
  setupController: (controller, model) ->
    @_super(controller, model)
    @controllerFor('main.admin.scores.list').set('activeTab', 'archive')
    controller.set('detailModalIsOpen', false)
    controller.set('createPartModalIsOpen', false)

`export default AdminScoresListArchiveRoute`
