`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'scores', ->
  @route 'admin', ->
    @resource 'admin.scores', { path: '/scores' }, ->
      @route 'add'
      @route 'edit', path: '/:id/edit'
  @route 'login'

`export default Router`
