import Ember from 'ember'

export default Ember.Controller.extend
  queryParams: ['size']
  size: 10

  tabs: [
    { id: 'perEvent', title: 'Aanwezigheden per repetitie' }
    { id: 'perAttendee', title: 'Aanwezigheden per muzikant' }
  ]
  selectedTab: 'perEvent'
  showPerEvent: Ember.computed.equal 'selectedTab', 'perEvent'
  showPerAttendee: Ember.computed.equal 'selectedTab', 'perAttendee'

  eventSorting: ['startDate']
  sortedEvents: Ember.computed.sort 'model.events', 'eventSorting'
  eventDates: Ember.computed.map 'sortedEvents', (event, i) ->
    event.get('startDate').toLocaleDateString('nl') if event.get('startDate')

  attendeeCounts: Ember.computed.map 'sortedEvents.@each.attendees', (event, i) ->
    event.get('attendees.length')
  legitimateAbsenteeCounts: Ember.computed.map 'sortedEvents.@each.legitimateAbsentees', (event, i) ->
    event.get('legitimateAbsentees.length')
  illegitimateAbsenteeCounts: Ember.computed.map 'sortedEvents.@each.illegitimateAbsentees', (event, i) ->
    event.get('illegitimateAbsentees.length')
  perEventChart: Ember.computed 'eventDates', 'attendeeCounts', 'legitimateAbsenteeCounts', 'illegitimateAbsenteeCounts', ->
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
  perEventChartOptions:
    scales:
      yAxes: [
        ticks: { min: 0 }
      ]

  musicianAttendances: Ember.computed 'model.musicians', 'model.musicians.@each.attendances', 'model.musicians.@each.legitimateAbsences', 'model.musicians.@each.illegitimateAbsences', ->
    @get('model.musicians').map (musician, i) ->
      name: musician.get('name')
      attendances: musician.get('attendances.length')
      legitimateAbsences: musician.get('legitimateAbsences.length')
      illegitimateAbsences: musician.get('illegitimateAbsences.length')
