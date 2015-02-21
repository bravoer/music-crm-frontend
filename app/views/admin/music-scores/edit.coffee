`import Ember from 'ember'`

AdminMusicScoresEditView = Ember.View.extend
  didInsertElement: ->
    $('select').material_select()
    $('.modal-trigger').leanModal()        
    
`export default AdminMusicScoresEditView`
