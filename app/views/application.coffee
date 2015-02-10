`import Ember from 'ember'`

ApplicationView = Ember.View.extend
  didInsertElement: ->
    $('.button-collapse').sideNav()
    $('.collapsible').collapsible()
    $('select').material_select()
    
`export default ApplicationView`
