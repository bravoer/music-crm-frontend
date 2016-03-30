`import Ember from 'ember'`
`import PagePagination from 'client/mixins/page-pagination'`

AdminScoresListArchiveController = Ember.Controller.extend PagePagination, 
  queryParams: ['sort']
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
