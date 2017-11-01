import Ember from 'ember'

export default Ember.Controller.extend
  options: Ember.inject.service()
  musiciansWithGroup: Ember.computed 'model', ->
    @get('model.musicians').map (musician) ->
      groups = musician.get('groups').map (group) -> group.get('name')
      musician.set('majorGroup', 'backup') if groups.includes('backup')
      musician.set('majorGroup', 'youthband') if groups.includes('youthband')
      musician.set('majorGroup', 'bravoer') if groups.includes('bravoer')
      musician.set('majorGroup', 'none') unless musician.get('majorGroup')
      musician
  selectedGroup: 'bravoer'
  groups: ['bravoer', 'youthband', 'backup', 'none']
  actions:
    linkUser: (contact, user) ->
      contact.set('user', user)
      contact.save()
    unlinkUser: (contact) ->
      contact.set('user', null)
      contact.save()
    goToMusician: (contact) ->
      @transitionToRoute 'main.admin.musicians.edit', contact
