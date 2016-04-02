`import Ember from 'ember'`

AdminScoresListArchiveController = Ember.Controller.extend
  queryParams: ['page', 'size', 'sort']
  page: 0
  size: 20
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
