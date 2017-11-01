import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  eventTypes: Ember.computed 'options', ->
    @get('options').eventTypes()
