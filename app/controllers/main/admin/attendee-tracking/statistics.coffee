`import Ember from 'ember'`

MainAdminAttendeeTrackingStatisticsController = Ember.Controller.extend
  eventSorting: ['startDate']
  events: Ember.computed.sort 'model', 'eventSorting'
  eventDates: Ember.computed.map 'events', (event, i) ->
    event.get('startDate').toLocaleDateString('nl') if event.get('startDate')
  attendeeCounts: Ember.computed.map 'events.@each.attendees', (event, i) ->
    event.get('attendees.length')
  legitimateAbsenteeCounts: Ember.computed.map 'events.@each.legitimateAbsentees', (event, i) ->
    event.get('legitimateAbsentees.length')
  illegitimateAbsenteeCounts: Ember.computed.map 'events.@each.illegitimateAbsentees', (event, i) ->
    event.get('illegitimateAbsentees.length')
  chart: Ember.computed 'eventDates', 'attendeeCounts', 'legitimateAbsenteeCounts', 'illegitimateAbsenteeCounts', ->
    labels: @get('eventDates')
    datasets: [
      {
        label: 'Aanwezig'
        backgroundColor: @get('eventDates').map () -> 'rgba(76, 175, 80, 1)' # green
        data: @get('attendeeCounts')
      },
      {
        label: 'Afwezig'
        backgroundColor: @get('eventDates').map () -> 'rgba(255, 152, 0, 1)' # orange
        data: @get('legitimateAbsenteeCounts')
      },
      {
        label: 'Niet verwittigd'
        backgroundColor: @get('eventDates').map () -> 'rgba(244, 67, 54, 1)' # red
        data: @get('illegitimateAbsenteeCounts')
      }
    ]

`export default MainAdminAttendeeTrackingStatisticsController`
