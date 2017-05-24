import Ember from 'ember'

export default Ember.Controller.extend
  session: Ember.inject.service('session')
  burgerMenu: Ember.inject.service()
  actions:
    toggleMenu: ->
      @get('burgerMenu').toggleProperty('open')
