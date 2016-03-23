`import Ember from 'ember'`

AdminScoresIndexController = Ember.Controller.extend
  queryParams: ['page', 'size']
  page: 0
  size: 1
  tabs: [
    { id: 'activeScores', title: 'Muziekstukken' }
    { id: 'archivedScores', title: 'Archief' }
  ]
  activeTab: 'activeScores'
  isActiveScores: Ember.computed 'activeTab', ->
    @get('activeTab') == 'activeScores'
  activeScores: Ember.computed.filterBy('model', 'status', 'active')
  archivedScores: Ember.computed.filterBy('model', 'status', 'archived')
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

`export default AdminScoresIndexController`
