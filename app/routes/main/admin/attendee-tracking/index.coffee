`import Ember from 'ember'`

MainAdminAttendeeTrackingIndexRoute = Ember.Route.extend
  model: ->
    @store.query 'event', { sort: '-start-date' }

`export default MainAdminAttendeeTrackingIndexRoute`
