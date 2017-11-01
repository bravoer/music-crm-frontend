import Ember from 'ember'

export default Ember.Component.extend
  init: () ->
    @_super()
    @get('musician.telephones').then (telephones) =>
      if telephones.length == 0
        phone = @get('store').createRecord('telephone')
        telephones.pushObject(phone)
    @get('musician.address').then (address) =>
      unless address
        addr = @get('store').createRecord('address')
        @set('musician.address', addr)
  options: Ember.inject.service()
  store: Ember.inject.service()
  instruments: Ember.computed 'options', ->
    @get('options').instruments()
  groups: Ember.computed 'options', ->
    @get('options').musicianGroups()
  actions:
    addPhone: () ->
      @get('musician.telephones').then (telephones) =>
        phone = @get('store').createRecord('telephone')
        telephones.pushObject(phone)
    toggleGroup: (group) ->
      @get('musician.groups').then (groups) ->
        if groups.includes(group)
          groups.removeObject(group)
        else
          groups.pushObject(group)
