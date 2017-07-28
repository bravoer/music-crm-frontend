import Ember from 'ember'

export default Ember.Component.extend
  export: Ember.inject.service()
  actions:
    export: () ->
      @get('export').exportSympathizers()
