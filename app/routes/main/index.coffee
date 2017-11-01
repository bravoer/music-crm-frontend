import Ember from 'ember'

export default Ember.Route.extend
  activate: ->
    Ember.$('body').addClass('dashboard-container')
  deactivate: ->
    Ember.$('body').removeClass('dashboard-container')
