import Ember from 'ember'
import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin'

export default Ember.Route.extend UnauthenticatedRouteMixin,
  activate: ->
    Ember.$('body').addClass('login-body')
  deactivate: ->
    Ember.$('body').removeClass('login-body')
