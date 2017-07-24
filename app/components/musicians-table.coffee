import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  groups: Ember.computed 'options', ->
    @get('options').musicianGroups()
