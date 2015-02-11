`import Ember from 'ember'`

AdminMusicScoresIndexController = Ember.ArrayController.extend
  sortProperties: ['title']
  actions:
    selectScore: (score) ->
      @set 'selectedScore', score

`export default AdminMusicScoresIndexController`
