`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

MainRoute = Ember.Route.extend AuthenticatedRouteMixin,
  actions:
    logout: ->
      @get('session').invalidate('authenticator:mu-semtech')

`export default MainRoute`
