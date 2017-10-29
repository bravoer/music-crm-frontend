import Ember from 'ember'

export default Ember.Component.extend
  isPresent: Ember.computed 'event.attendees.[]', ->
    @get('event.attendees').indexOf(@get('invitee')) >= 0
  isAbsent: Ember.computed 'event.absentees.[]', ->
    @get('event.absentees').indexOf(@get('invitee')) >= 0
  _setInviteeStatus: (list) ->
    event = @get('event')
    invitee = @get('invitee')
    Promise.all([event.get('attendees'), event.get('absentees')]).then (invitees) ->
      # remove invitee from all arrays
      invitees[0].removeObject(invitee)
      invitees[1].removeObject(invitee)

      # add invitee to the correct array
      event.get(list).then (invitees) ->
        invitees.pushObject(invitee)
        event.save()
  actions:
    setPresent: (invitee) ->
      @_setInviteeStatus('attendees')
    setAbsent: (invitee) ->
      @_setInviteeStatus('absentees')
