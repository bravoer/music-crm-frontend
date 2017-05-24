import Ember from 'ember'
import EventTypeOptions from 'client/config/event-type-options'

export default Ember.Controller.extend
  eventTypes: EventTypeOptions.get('types')
  date: new Date()
  updateStartDate: Ember.observer 'date', ->
    @set('model.startDate', new Date(@get('date')))
  updateName: Ember.observer 'model.type', 'model.startDate', ->
    unless @get('model.isDeleted')
      name = @i18n.t(@get('model.type'))
      name += ' ' + @get('model.startDate').toLocaleDateString('nl') if @get('model.startDate')
      @set('model.name', name)
