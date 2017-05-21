# coffeelint: disable=no_empty_functions
`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType
  rootURL: config.rootURL

Router.map ->
  @route 'login'
  @route 'main', path: '/', ->
    @route 'scores', ->
    @route 'admin', ->
      @route 'scores', ->
        @route 'index', path: '/:status'
        @route 'add'
        @route 'edit', path: '/:id'
        @route 'list', ->
          @route 'active'
          @route 'archive'
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
        @route 'edit', path: '/:id'
      @route 'attendeeTracking', ->
        @route 'index'
        @route 'add'
        @route 'track', path: '/:id/track'
        @route 'statistics'
    @route 'profile', ->
    @route 'system', ->
      @route 'users'
      @route 'authorization'

`export default Router`

# coffeelint: enable=no_empty_functions
