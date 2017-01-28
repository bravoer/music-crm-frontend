`import Ember from 'ember'`
`import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'`

MainAdminMusiciansIndexController = Ember.Controller.extend DefaultQueryParams,
  sort: 'last-name'

`export default MainAdminMusiciansIndexController`
