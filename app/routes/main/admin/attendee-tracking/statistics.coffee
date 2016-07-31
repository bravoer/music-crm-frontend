`import Ember from 'ember'`

MainAdminAttendeeTrackingStatisticsRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      events: @store.query 'event',
        sort: '-start-date'
        page:
          size: params.size
      musicians: @store.query 'musician',
        sort: 'last-name'
        page:
          size: 10000
  queryParams:
    size:
      refreshModel: true
        
`export default MainAdminAttendeeTrackingStatisticsRoute`
