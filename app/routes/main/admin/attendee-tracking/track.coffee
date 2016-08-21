`import Ember from 'ember'`

MainAdminAttendeeTrackingTrackRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      event: @store.findRecord 'event', params.id, { include: 'attendees,legitimate-absentees,illegitimate-absentees' }
      musicians: @store.query 'musician', { page: { size: 10000 }, sort: 'last-name' }

`export default MainAdminAttendeeTrackingTrackRoute`
