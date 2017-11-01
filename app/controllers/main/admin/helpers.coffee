import Ember from 'ember'

export default Ember.Controller.extend
  paperToaster: Ember.inject.service()
  store: Ember.inject.service()
  sort: '-start-date'
  size: 10
  newEvent: null
  createIsEnabled: Ember.computed 'newEvent', ->
    @get('newEvent') != null
  actions:
    createEvent: () ->
      event = @get('store').createRecord 'event',
        startDate: new Date()
        type: 'concert'
      @set('newEvent', event)
    cancelEvent: () ->
      @get('newEvent').rollbackAttributes()
      @set('newEvent', null)
    saveEvent: () ->
      @get('newEvent').save().then (event) =>
        @get('paperToaster').show("#{@get('newEvent.name')} opgeslagen", { position: 'top right' })
        @set('newEvent', null)
        @send('refreshModel')
