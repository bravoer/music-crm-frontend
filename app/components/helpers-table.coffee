import Ember from 'ember'

export default Ember.Component.extend
  searchService: Ember.inject.service('advanced-search')
  helpers: Ember.computed 'searchService', ->
    @get('searchService').helpers()
