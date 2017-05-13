`import Ember from 'ember'`

MainSystemUsersRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      users: @store.query 'user', {
        page:
          size: 1000
        sort: 'name'
      }
      musicians: @store.query 'musician', {
        page:
          size: 1000
        sort: 'last-name'
        include: 'groups'
      }

`export default MainSystemUsersRoute`
