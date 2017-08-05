import Ember from 'ember'
import DataTableRouteMixin from 'ember-data-table/mixins/route'

export default Ember.Route.extend DataTableRouteMixin,
  modelName: 'event'
  mergeQueryOptions: (params) ->
    'filter[type]': 'http://mu.semte.ch/vocabularies/ext/bravoer/event-types/Concert'
  actions:
    refreshModel: () ->
      @refresh()
