`import Ember from 'ember'`

MenuComponentComponent = Ember.Component.extend
  didInsertElement: ->
    Ember.$('.dropdown-button').dropdown()
  actions:
    logout: ->
      @sendAction 'logout'

`export default MenuComponentComponent`
