import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  genres: Ember.computed 'options', ->
    @get('options').genres()
