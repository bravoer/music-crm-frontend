`import Ember from 'ember'`

MusicScoresIndexView = Ember.View.extend
  didInsertElement: ->
    $('select').material_select()
        
`export default MusicScoresIndexView`
