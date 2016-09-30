`import Ember from 'ember'`

AttendeeListComponent = Ember.Component.extend
  store: Ember.inject.service()
  attendees: Ember.computed 'store', ->
    @get('store').query 'musician', { page: { size: 10000 }, sort: 'last-name' }
  attendeeCount: Ember.computed.alias('event.attendees.length')
  legitimateAbsenteeCount: Ember.computed.alias('event.legitimateAbsentees.length')
  illegitimateAbsenteeCount: Ember.computed.alias('event.illegitimateAbsentees.length')
  unknownCount: Ember.computed 'attendees', 'attendeeCount', 'legitimateAbsenteeCount', 'illegitimateAbsenteeCount', ->
    @get('attendees.length') - @get('attendeeCount') - @get('legitimateAbsenteeCount') - @get('illegitimateAbsenteeCount')
  chartData: Ember.computed 'attendeeCount', 'legitimateAbsenteeCount', 'illegitimateAbsenteeCount', ->
    [
      @get('attendeeCount'),
      @get('legitimateAbsenteeCount'),
      @get('illegitimateAbsenteeCount'),
      @get('unknownCount')
    ]
  chart: Ember.computed 'chartData', ->
    labels: ['Aanwezig', 'Afwezig', 'Niet verwittigd', 'Onbekend']
    datasets: [{
      data: @get('chartData')
      backgroundColor: [
        '#4CAF50' # green
        '#FF9800' # orange
        '#F44336' # red
        '#9e9e9e' # grey
      ]
    }]
      

`export default AttendeeListComponent`
