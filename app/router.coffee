`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'login'
  @resource 'main', { path: '/' }, ->
    @resource 'scores', ->
    @route 'admin', ->
      @resource 'admin.scores', { path: '/scores' }, ->
        @route 'add'
        @route 'edit', path: '/:id/edit'
    @resource 'profile', ->

`export default Router`
