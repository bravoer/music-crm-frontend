import Ember from 'ember'

export default Ember.Controller.extend
  session: Ember.inject.service('session')
  instrument: Ember.computed.alias('session.data.instrument')
