import Ember from 'ember'
import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'

export default Ember.Controller.extend DefaultQueryParams,
  sort: 'last-name'
