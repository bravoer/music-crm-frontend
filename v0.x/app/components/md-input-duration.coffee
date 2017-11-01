import Ember from 'ember'

export default Ember.Component.extend
  myMillis: Ember.computed.oneWay 'millis'
  _minutes: () ->
    if @get('myMillis') then Math.floor( parseInt( @get('myMillis')) / 60000 ) else 0
  minutes: Ember.computed 'myMillis',
    get: () ->
      @_minutes()
    set: (_key, value) ->
      @updateTime( parseInt(value), @get('seconds') ) if value
      @_minutes()

  _seconds: () ->
    totalSeconds =
      if @get('myMillis')
        Math.floor( parseInt(@get('myMillis')) / 1000 )
      else
        0
    totalSeconds % 60
  seconds: Ember.computed 'myMillis',
    get: ->
      @_seconds()
    set: (_key, value)->
      @updateTime( @get('minutes') , parseInt(value) ) if value
      @_seconds()

  updateTime: (mm, ss) ->
    seconds = ( parseInt(mm) * 60 ) + parseInt(ss)
    millis = seconds * 1000
    unless parseInt('myMillis') == millis
      @set('millis', millis)
