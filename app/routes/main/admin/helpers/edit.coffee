`import Ember from 'ember'`

MainAdminHelpersEditRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'event', params.id, { include: 'helpers' }

`export default MainAdminHelpersEditRoute`
