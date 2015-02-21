`import Ember from 'ember'`

AdminMusicScoresAddView = Ember.View.extend
  didInsertElement: ->
    $('select').material_select()
    $('.modal-trigger').leanModal()
    
`export default AdminMusicScoresAddView`
