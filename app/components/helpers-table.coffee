`import Ember from 'ember'`

HelpersTableComponent = Ember.Component.extend
  searchService: Ember.inject.service('advanced-search')
  helpers: Ember.computed 'searchService', ->
    @get('searchService').helpers()

`export default HelpersTableComponent`
