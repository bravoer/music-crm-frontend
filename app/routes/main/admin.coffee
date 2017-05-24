import Ember from 'ember'
import { CanMixin } from 'ember-can'

export default Ember.Route.extend CanMixin,
  beforeModel: ->
    @transitionTo('main.scores.index') unless @can 'manage admin'
