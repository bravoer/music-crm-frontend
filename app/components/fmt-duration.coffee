import Ember from 'ember'

###
# Component to render millis as 'hh:mm:ss'
###
export default Ember.Component.extend
  tagName: 'span'
  seconds: Ember.computed 'millis', ->
    parseInt( (@get('millis') / 1000) % 60 ) if @get('millis')
  minutes: Ember.computed 'millis', ->
    parseInt( (@get('millis') / (1000 * 60) ) % 60 ) if @get('millis')
  hours: Ember.computed 'millis', ->
    parseInt( (@get('millis') / (1000 * 60 * 60) ) % 24 ) if @get('millis')
  time: Ember.computed 'millis', 'seconds', 'minutes', 'hours', ->
    if @get('millis')
      time = ''
      time += @get('hours') + ':' if @get('hours')
      time += '0' if @get('minutes') < 10
      time += @get('minutes') + ':'
      time += '0' if @get('seconds') < 10
      time += @get('seconds')
      time
