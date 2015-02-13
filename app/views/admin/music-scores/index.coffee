`import Ember from 'ember'`

AdminMusicScoresIndexView = Ember.View.extend
  didInsertElement: ->
    $('.modal-trigger').leanModal()
        
`export default AdminMusicScoresIndexView`
