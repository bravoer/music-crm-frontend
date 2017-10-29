import Ember from 'ember'
import DS from 'ember-data'

export default Ember.Component.extend
  store: Ember.inject.service()
  invitees: Ember.computed 'store', 'event', ->
    musiciansPromise = @get('store').query 'musician',
      page: { size: 10000 }
      sort: 'last-name'
      filter: { groups: { name: 'bravoer' } }
    attendeesPromise = @get('event.attendees')
    absenteesPromise = @get('event.absentees')
    DS.PromiseArray.create(
      promise: Promise.all([
        musiciansPromise,
        attendeesPromise,
        absenteesPromise
      ]).then (values) ->
        invitees = values[0].toArray().concat(values[1].toArray().concat(values[2].toArray()))
        invitees.uniq().sortBy('instrument', 'lastName')
    )
