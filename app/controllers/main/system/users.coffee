import Ember from 'ember'

export default Ember.Controller.extend
  options: Ember.inject.service()
  musiciansWithGroup: Ember.computed 'model', ->
    @get('model.musicians').map (musician) ->
      groups = musician.get('groups').map (group) -> group.get('name')
      musician.set('majorGroup', 'reserven') if groups.includes('reserven')
      musician.set('majorGroup', 'jeugdband') if groups.includes('jeugdband')
      musician.set('majorGroup', 'bravoer') if groups.includes('bravoer')
      musician.set('majorGroup', 'geen') unless musician.get('majorGroup')
      musician
  selectedGroup: 'bravoer'
  groups: ['bravoer', 'jeugdband', 'reserven', 'geen']
  actions:
    linkUser: (contact, user) ->
      contact.set('user', user)
      contact.save()
    unlinkUser: (contact) ->
      contact.set('user', null)
      contact.save()
    goToMusician: (contact) ->
      @transitionToRoute 'main.admin.musicians.edit', contact
