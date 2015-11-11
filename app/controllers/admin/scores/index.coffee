`import Ember from 'ember'`

AdminScoresIndexController = Ember.ArrayController.extend
  sortProperties: ['title']
  tabs: [
    { id: 'activeScores', title: 'Muziekstukken' }
    { id: 'archivedScores', title: 'Archief' }
  ]
  activeTab: 'activeScores'
  isActiveScores: Ember.computed 'activeTab', ->
    @get('activeTab') == 'activeScores'
  activeScores: Ember.computed.filterBy('model', 'status', 'active')
  archivedScores: Ember.computed.filterBy('model', 'status', 'archived')

`export default AdminScoresIndexController`
