`import Ember from 'ember'`

AdminMusicScoresIndexController = Ember.ArrayController.extend
  sortProperties: ['title']
  activeScores: Ember.computed.filterBy('model', 'status', 'active')
  archivedScores: Ember.computed.filterBy('model', 'status', 'archived')
  actions:
    selectScore: (score) ->
      @set 'selectedScore', score
    toggleStatus: (score) ->
      if score.get('isActive')
        score.set('status', 'archived')
      else
        score.set('status', 'active')
      score.save()

`export default AdminMusicScoresIndexController`
