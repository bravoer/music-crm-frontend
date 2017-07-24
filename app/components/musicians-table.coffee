import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  export: Ember.inject.service()
  groups: Ember.computed 'options', ->
    @get('options').musicianGroups()
  actions:
    export: () ->
      @get('export').exportMusicians(@get('group'))
