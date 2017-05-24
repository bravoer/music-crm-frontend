import Ember from 'ember'

export default Ember.Component.extend
  store: Ember.inject.service('store')
  sympathizers: Ember.computed 'store', ->
    @get('store').findAll('sympathizer')
  actions:
    search: (term) ->
      @get('store').query 'sympathizer',
        filter: term
    addHelper: (helper) ->
      @sendAction('action', helper)
