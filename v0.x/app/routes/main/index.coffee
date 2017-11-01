import Ember from 'ember'

export default Ember.Route.extend
  activate: ->
    Ember.$('body').addClass('homepage')
  deactivate: ->
    Ember.$('body').removeClass('homepage')
