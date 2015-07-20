`import Ember from 'ember'`

MdInputDurationComponent = Ember.Component.extend
  myMillis: Ember.computed.oneWay 'millis'
  _minutes: () ->
    if @get('myMillis') then Math.floor( Number.parseInt( @get('myMillis')) / 60000 ) else 0
  minutes: Ember.computed 'myMillis',
    get: () ->
      @_minutes()
    set: (_key, value) ->
      @updateTime( Number.parseInt(value), @get('seconds') ) if value
      @_minutes()
   
  _seconds: () ->
    totalSeconds =
      if @get('myMillis')
        Math.floor( Number.parseInt(@get('myMillis')) / 1000 )
      else
        0
    totalSeconds % 60
  seconds: Ember.computed 'myMillis',
    get: ->
      @_seconds()
    set: (_key, value)->
      @updateTime( @get('minutes') , Number.parseInt(value) ) if value
      @_seconds()
    
  updateTime: (mm, ss) ->
    seconds = ( Number.parseInt(mm) * 60 ) + Number.parseInt(ss)
    millis = seconds * 1000
    unless Number.parseInt('myMillis') == millis
      @set('millis', millis)

`export default MdInputDurationComponent`
