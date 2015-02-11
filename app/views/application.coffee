`import Ember from 'ember'`

ApplicationView = Ember.View.extend
  didInsertElement: ->
    $('.button-collapse').sideNav()
    $('.collapsible').collapsible()
    
    $('select').material_select()
    
    # the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal()
        
`export default ApplicationView`
