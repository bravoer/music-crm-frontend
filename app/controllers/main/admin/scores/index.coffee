`import Ember from 'ember'`
`import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'`

MainAdminScoresIndexController = Ember.Controller.extend DefaultQueryParams,
  sort: 'title'
  tabs: [
    { id: 'active', title: 'Actief' }
    { id: 'all', title: 'Bibliotheek' }
  ]
  tabChanged: Ember.observer 'status', ->
    @transitionToRoute('main.admin.scores.index', @get('status'))

`export default MainAdminScoresIndexController`
