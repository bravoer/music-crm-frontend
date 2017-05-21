`import Ember from 'ember'`

MainAdminAttendeeTrackingIndexRoute = Ember.Route.extend
  model: ->
    @store.query 'event',
      sort: '-start-date'
      page:
        size: 10000
      filter:
        type: 'http://mu.semte.ch/vocabularies/ext/bravoer/event-types/Rehearsal'

`export default MainAdminAttendeeTrackingIndexRoute`
