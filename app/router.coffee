`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'login'
  @route 'main', path: '/', ->
    @route 'scores', ->
    @route 'admin', ->
      @route 'scores', ->
        @route 'add'
        @route 'edit', path: '/:id/edit'
        @route 'list', ->
          @route 'active'
          @route 'archive'
      @route 'musicians', ->
        @route 'index'
        @route 'add'
    @route 'profile', ->

`export default Router`
