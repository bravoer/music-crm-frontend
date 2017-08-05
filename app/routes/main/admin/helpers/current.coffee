import Ember from 'ember'

export default Ember.Route.extend
  advancedSearch: Ember.inject.service()
  model: () ->
    @get('advancedSearch').helpers()
