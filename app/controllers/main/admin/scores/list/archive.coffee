`import Ember from 'ember'`
`import DefaultQueryParams from 'ember-data-table/mixins/default-query-params'`

AdminScoresListArchiveController = Ember.Controller.extend DefaultQueryParams,
  sort: 'title'
  actions:
    openScoreDetailModal: (score) ->
      @set('detailedScore', score)
      @set('detailModalIsOpen', true)
      return false
    openNewPartModal: (score) ->
      part = @get('store').createRecord('part', {})
      @set('newPart', part)
      @set('scoreToCreatePartFor', score)
      @set('createPartModalIsOpen', true)
      return false

`export default AdminScoresListArchiveController`
