`import Ember from 'ember'`

MainAdminAttendeeTrackingStatisticsRoute = Ember.Route.extend
  model: ->
    @store.query 'event',
      sort: '-start-date'
      page:
        size: 10000

`export default MainAdminAttendeeTrackingStatisticsRoute`
