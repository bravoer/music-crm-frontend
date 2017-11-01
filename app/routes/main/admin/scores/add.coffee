import Ember from 'ember'

export default Ember.Route.extend
  model: ->
    @store.createRecord 'score', { status: 'active' }
