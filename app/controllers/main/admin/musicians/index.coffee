`import Ember from 'ember'`
`import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'`

MainAdminMusiciansIndexController = Ember.Controller.extend DefaultQueryParams,
  store: Ember.inject.service()
  sort: 'last-name'
  group: 'bravoer'
  groups: Ember.computed 'store', ->
    @get('store').findAll('musicianGroup')
  filterBtnText: Ember.computed 'group', ->
    'Toon: ' + @get('i18n').t(@get('group'))
  actions:
    changeGroup: (group) ->
      console.log 'Changing group to ' + group.get('name')
      @set('page', 0)
      @set('group', group.get('name'))

`export default MainAdminMusiciansIndexController`
