`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  actions:
    logout: ->
      @get('session').invalidate('authenticator:mu-semtech')

`export default ApplicationRoute`

