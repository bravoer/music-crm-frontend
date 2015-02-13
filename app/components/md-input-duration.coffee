`import Ember from 'ember'`

MdInputDurationComponent = Ember.Component.extend
  myMillis: Ember.computed.oneWay 'millis'
  minutes: Ember.computed 'myMillis', (key, value) ->
    @updateTime( Number.parseInt(value), @get('seconds') ) if value
    Math.floor( Number.parseInt( @get('myMillis')) / 60000 )
  seconds: Ember.computed 'myMillis', (key, value) ->
    @updateTime( @get('minutes') , Number.parseInt(value) ) if value
    totalSeconds = Math.floor( Number.parseInt(@get('myMillis')) / 1000 )
    totalSeconds % 60
  updateTime: (mm, ss) ->
    seconds = ( Number.parseInt(mm) * 60 ) + Number.parseInt(ss)
    millis = seconds * 1000
    unless Number.parseInt('myMillis') == millis
      @set('millis', millis)

`export default MdInputDurationComponent`
