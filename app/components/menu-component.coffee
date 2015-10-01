`import Ember from 'ember'`

MenuComponentComponent = Ember.Component.extend
  didInsertElement: ->
    Ember.$('.button-collapse').sideNav()
    Ember.$('.collapsible').collapsible()

`export default MenuComponentComponent`
