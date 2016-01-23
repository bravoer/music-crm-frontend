`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

MainRoute = Ember.Route.extend AuthenticatedRouteMixin,
  session: Ember.inject.service('session')
  actions:
    logout: ->
      @get('session').invalidate('authenticator:mu-semtech')

`export default MainRoute`
