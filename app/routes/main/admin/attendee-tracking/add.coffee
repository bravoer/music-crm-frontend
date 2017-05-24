import Ember from 'ember'

export default Ember.Route.extend
  model: ->
    @store.createRecord 'event',
      type: 'rehearsal'
      startDate: new Date()
  actions:
    save: ->
      event = @modelFor('main.admin.attendeeTracking.add')
      event.save().then =>
        @transitionTo 'main.admin.attendeeTracking.index'
    cancel: ->
      event = @modelFor('main.admin.attendeeTracking.add')
      event.rollbackAttributes()
      @transitionTo 'main.admin.attendeeTracking.index'
