`import Ember from 'ember'`
`import { CanMixin } from 'ember-can'`

MainAdminRoute = Ember.Route.extend CanMixin,
  beforeModel: ->
    @transitionTo('main.scores.index') unless @can 'manage admin'

`export default MainAdminRoute`
