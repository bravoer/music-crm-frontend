`import Ember from 'ember'`

AdminMusicScoresIndexView = Ember.View.extend
  didInsertElement: ->
    $('select').material_select()
        
`export default AdminMusicScoresIndexView`
