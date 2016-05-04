`import Ember from 'ember'`
`import { CanMixin } from 'ember-can'`

MainSystemRoute = Ember.Route.extend CanMixin,
  beforeModel: ->
    @transitionTo('main.scores.index') unless @can 'manage system'

`export default MainSystemRoute`
