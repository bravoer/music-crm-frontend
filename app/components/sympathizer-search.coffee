`import Ember from 'ember'`

SympathizerSearchComponent = Ember.Component.extend
  store: Ember.inject.service('store')
  sympathizers: Ember.computed 'store', ->
    @get('store').findAll('sympathizer')
  actions:
    search: (term) ->
      @get('store').query 'sympathizer',
        filter: term
    addHelper: (helper) ->
      @sendAction('action', helper)

`export default SympathizerSearchComponent`
