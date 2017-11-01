import Ember from 'ember'
import EventTypeOptions from 'client/config/event-type-options'

export default Ember.Component.extend
  store: Ember.inject.service('store')
  eventTypes: EventTypeOptions.get('types')
  isCollapsed: true
  date: new Date()
  actions:
    save: ->
      startDate = new Date(@get('datepicker'))
      event = @get('store').createRecord 'event',
        name: @get('name')
        type: @get('type')
        startDate: startDate
      event.save().then (event) =>
        @sendAction('action', event)
        @set('isCollapsed', true)
    cancel: ->
      @set('isCollapsed', true)
