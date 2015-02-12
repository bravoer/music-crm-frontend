`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'musicScores', ->
  @route 'admin', ->
    @resource 'admin.musicScores', { path: '/musicScores' }, ->
      @route 'edit', path: '/:id/edit'

`export default Router`
