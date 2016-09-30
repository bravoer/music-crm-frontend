`import Ember from 'ember'`

MainAdminAttendeeTrackingTrackRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'event', params.id, { include: 'attendees,legitimate-absentees,illegitimate-absentees' }

`export default MainAdminAttendeeTrackingTrackRoute`
