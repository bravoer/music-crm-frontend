`import Ember from 'ember'`

MainAdminAttendeeTrackingIndexRoute = Ember.Route.extend
  model: ->
    @store.query 'event',
      sort: '-start-date'
      page:
        size: 10000

`export default MainAdminAttendeeTrackingIndexRoute`
