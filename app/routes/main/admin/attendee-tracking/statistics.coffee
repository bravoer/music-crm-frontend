`import Ember from 'ember'`

MainAdminAttendeeTrackingStatisticsRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      events: @store.query 'event',
        sort: '-start-date'
        page:
          size: 10000
      musicians: @store.query 'musician',
        sort: 'last-name'
        page:
          size: 10000
        
`export default MainAdminAttendeeTrackingStatisticsRoute`
