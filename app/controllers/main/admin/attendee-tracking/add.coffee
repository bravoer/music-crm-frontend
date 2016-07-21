`import Ember from 'ember'`
`import EventTypeOptions from 'client/config/event-type-options'`

MainAdminAttendeeTrackingAddController = Ember.Controller.extend
  eventTypes: EventTypeOptions.get('types')
  date: new Date()
  updateStartDate: Ember.observer 'date', ->
    @set('model.startDate', new Date(@get('date')))
  updateName: Ember.observer 'model.type', 'model.startDate', ->
    name = @i18n.t(@get('model.type')) + ' ' + @get('model.startDate').toLocaleDateString('nl')
    @set('model.name', name)

`export default MainAdminAttendeeTrackingAddController`
