`import Ember from 'ember'`

MainIndexController = Ember.Controller.extend
  session: Ember.inject.service('session')
  burgerMenu: Ember.inject.service()
  actions:
    toggleMenu: ->
      @get('burgerMenu').toggleProperty('open')

`export default MainIndexController`
