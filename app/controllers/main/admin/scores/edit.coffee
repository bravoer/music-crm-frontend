import Ember from 'ember'

export default Ember.Controller.extend
  editMode: true
  options: Ember.inject.service()
  genres: Ember.computed 'options', ->
    @get('options').genres()
  actions:
    cancel: () ->
      if @get('editMode')
        @get('model').rollbackAttributes()
        @set('editMode', false)
      else
        @transitionToRoute('main.admin.scores.index')
    save: () ->
      @set('model.modified', new Date())
      @get('model').save().then () =>
        @set('editMode', false)
