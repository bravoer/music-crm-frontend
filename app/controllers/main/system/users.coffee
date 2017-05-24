`import Ember from 'ember'`

MainSystemUsersController = Ember.Controller.extend
  musiciansWithGroup: Ember.computed 'model', ->
    @get('model.musicians').map (musician) ->
      groups = musician.get('groups').map (group) -> group.get('name')
      musician.set('majorGroup', 'backup') if groups.includes('backup')
      musician.set('majorGroup', 'youthband') if groups.includes('youthband')
      musician.set('majorGroup', 'bravoer') if groups.includes('bravoer')
      musician
  actions:
    selectUser: (contact, user) ->
      contact.set('user', user)
      contact.save()
    translate: (name) ->
      @get('i18n').t(name)

`export default MainSystemUsersController`
