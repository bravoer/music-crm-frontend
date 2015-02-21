`import Ember from 'ember'`

AdminMusicScoresIndexController = Ember.ArrayController.extend
  sortProperties: ['title']
  activeScores: Ember.computed.filterBy('model', 'status', 'active')
  archivedScores: Ember.computed.filterBy('model', 'status', 'archived')

`export default AdminMusicScoresIndexController`
