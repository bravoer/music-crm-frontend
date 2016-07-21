`import Ember from 'ember'`

MainAdminAttendeeTrackingTrackRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'event', params.id
  setupController: (controller, model) ->
    @_super(controller, model)
    musicians = @store.query 'musician', { page: { size: 1000 }, sort: 'last-name' }
    @controller.set('musicians', musicians)

`export default MainAdminAttendeeTrackingTrackRoute`
