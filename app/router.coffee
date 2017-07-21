import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend
  location: config.locationType
  rootURL: config.rootURL

Router.map ->
  @route 'main', path: '/', ->
    @route 'admin', ->
      @route 'scores', ->
        @route 'index',
        @route 'edit', path: '/:id'

export default Router
