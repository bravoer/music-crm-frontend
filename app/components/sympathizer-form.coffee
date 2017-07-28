import Ember from 'ember'

export default Ember.Component.extend
  init: () ->
    @_super()
    @get('sympathizer.telephones').then (telephones) =>
      if telephones.length == 0
        phone = @get('store').createRecord('telephone')
        telephones.pushObject(phone)
    @get('sympathizer.address').then (address) =>
      unless address
        addr = @get('store').createRecord('address')
        @set('sympathizer.address', addr)
  options: Ember.inject.service()
  store: Ember.inject.service()
  prefixes: Ember.computed 'options', ->
    @get('options').prefixes()
  actions:
    addPhone: () ->
      @get('sympathizer.telephones').then (telephones) =>
        phone = @get('store').createRecord('telephone')
        telephones.pushObject(phone)
    setCommunication: (onPaperFlag) ->
      communication = if onPaperFlag then 'paper' else 'email'
      @set('sympathizer.communication', communication)
      console.log('set communication ' + JSON.stringify(communication))
