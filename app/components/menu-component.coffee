`import Ember from 'ember'`

MenuComponentComponent = Ember.Component.extend
  session: Ember.inject.service('session')
  didInsertElement: ->
    Ember.$('.dropdown-button').dropdown()

`export default MenuComponentComponent`
