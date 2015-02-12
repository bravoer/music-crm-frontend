`import Ember from 'ember'`

AdminMusicScoresIndexView = Ember.View.extend
  didInsertElement: ->
    # the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal()
        
`export default AdminMusicScoresIndexView`
