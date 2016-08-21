`import Ember from 'ember'`

MainAdminAttendeeTrackingStatisticsRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      events: @store.query 'event',
        sort: '-start-date'
        page:
          size: params.size
        include: 'attendees,legitimate-absentees,illegitimate-absentees'
      musicians: @store.query 'musician',
        sort: 'last-name'
        page:
          size: 10000
        include: 'attendances,legitimate-absences,illegitimate-absences'
  queryParams:
    size:
      refreshModel: true
        
`export default MainAdminAttendeeTrackingStatisticsRoute`
