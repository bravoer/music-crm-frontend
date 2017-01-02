`import Ember from 'ember'`

AttendeeListItemComponent = Ember.Component.extend
  classNames: ['collection-item']
  status: Ember.computed 'event.attendees', 'event.legitimateAbsentees', 'event.illegitimateAbsentees', ->
    event = @get('event')
    attendee = @get('attendee')
    status = ''
    if event.get('attendees').indexOf(attendee) >= 0 then status = 'present'
    if event.get('legitimateAbsentees').indexOf(attendee) >= 0 then status = 'legitimateAbsent'
    if event.get('illegitimateAbsentees').indexOf(attendee) >= 0 then status = 'illegitimateAbsent'
    status
  isPresent: Ember.computed 'status', ->
    @get('status') == 'present'
  isLegitimateAbsent: Ember.computed 'status', ->
    @get('status') == 'legitimateAbsent'
  isIllegitimateAbsent: Ember.computed 'status', ->
    @get('status') == 'illegitimateAbsent'
  _setAttendeeStatus: (attendee, list) ->
    event = @get('event')
    Promise.all([
      event.get('attendees')
      event.get('legitimateAbsentees')
      event.get('illegitimateAbsentees')
    ]).then (attendees) ->
      attendees[0].removeObject(attendee)
      attendees[1].removeObject(attendee)
      attendees[2].removeObject(attendee)
      index = 0 # index of the list in the attendees array return by Promise.all
      switch list
        when 'attendees' then index = 0
        when 'legitimateAbsentees' then index = 1
        when 'illegitimateAbsentees' then index = 2
      event.get(list).then (attendees) ->
        attendees.pushObject(attendee)
        event.save()
  actions:
    setPresent: (attendee) ->
      @_setAttendeeStatus(attendee, 'attendees')
    setLegitimateAbsent: (attendee) ->
      @_setAttendeeStatus(attendee, 'legitimateAbsentees')
    setIllegitimateAbsent: (attendee) ->
      @_setAttendeeStatus(attendee, 'illegitimateAbsentees')

`export default AttendeeListItemComponent`
