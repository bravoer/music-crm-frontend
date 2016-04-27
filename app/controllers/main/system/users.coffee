`import Ember from 'ember'`

MainSystemUsersController = Ember.Controller.extend
  actions:
    selectUser: (contact, user) ->
      contact.set('user', user)
      contact.save()

`export default MainSystemUsersController`
