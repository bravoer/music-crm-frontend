import Ember from 'ember'

export default Ember.Controller.extend
  attendeesCount: Ember.computed.alias 'model.attendees.length'
  absenteesCount: Ember.computed.alias 'model.absentees.length'
