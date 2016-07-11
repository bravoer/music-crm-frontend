`import Ember from 'ember'`

MainSystemAuthorizationRoute = Ember.Route.extend
  model: (params) ->
    users: @store.query 'user', {
      page:
        size: 1000
      sort: 'name'
    }

`export default MainSystemAuthorizationRoute`
