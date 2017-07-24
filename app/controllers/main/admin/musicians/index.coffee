import Ember from 'ember'
import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'

export default Ember.Controller.extend DefaultQueryParams,
  sort: 'last-name'
  size: 25
  group: 'b209dbf2-e011-11e6-bf01-fe55135034f3' # bravoer
  actions:
    clickRow: (row) ->
      console.log("implement clickRow here")
