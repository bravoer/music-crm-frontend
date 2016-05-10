`import Ember from 'ember'`

MenuComponentComponent = Ember.Component.extend
  session: Ember.inject.service('session')
  didInsertElement: ->
    Ember.$('.dropdown-button').dropdown()
    Ember.$('.button-collapse').sideNav()
    Ember.$('.collapsible').collapsible( { accordion: false } )

`export default MenuComponentComponent`
