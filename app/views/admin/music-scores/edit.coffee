`import Ember from 'ember'`

AdminMusicScoresIndexView = Ember.View.extend
  didInsertElement: ->
    $('select').material_select()
    $('.modal-trigger').leanModal()        
    
`export default AdminMusicScoresIndexView`
