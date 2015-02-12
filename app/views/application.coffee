`import Ember from 'ember'`

ApplicationView = Ember.View.extend
  didInsertElement: ->
    $('.button-collapse').sideNav()
    $('.collapsible').collapsible()
    
`export default ApplicationView`
