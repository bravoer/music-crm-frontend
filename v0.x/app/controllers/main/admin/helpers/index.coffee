import Ember from 'ember'

export default Ember.Controller.extend
  actions:
    addEvent: (event) ->
      @send('invalidateModel')
