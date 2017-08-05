import Ember from 'ember'

export default Ember.Component.extend
  store: Ember.inject.service()
  _search: () ->
    @get('store').query 'sympathizer',
      size: 50
      filter: @get('searchText') if @get('searchText')
  options: Ember.computed 'store', () -> @_search()
  actions:
    search: () -> @_search()
