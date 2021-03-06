import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend
  location: config.locationType
  rootURL: config.rootURL

Router.map ->
  @route 'login'
  @route 'main', path: '/', ->
    @route 'profile'
    @route 'scores', ->
    @route 'admin', ->
      @route 'scores', ->
        @route 'index'
        @route 'add'
        @route 'edit', path: '/:id'
      @route 'musicians', ->
        @route 'index'
        @route 'add'
        @route 'edit', path: '/:id'
      @route 'sympathizers', ->
        @route 'index'
        @route 'add'
        @route 'edit', path: '/:id'
      @route 'helpers', ->
        @route 'index'
        @route 'current'
        @route 'event', path: '/event/:id'
      @route 'attendee-tracking', ->
        @route 'index'
        @route 'statistics'
        @route 'event', path: '/event/:id'
    @route 'system', ->
      @route 'authorization'
      @route 'users'

export default Router
