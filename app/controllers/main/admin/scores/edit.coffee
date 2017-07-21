import Ember from 'ember'

export default Ember.Controller.extend
  actions:
    cancel: () ->
      if @get('editMode')
        @get('model').rollbackAttributes()
        @set('editMode', false)
      else
        @transitionToRoute 'main.admin.scores.index'
    save: () ->
      @set('model.modified', new Date())
      @get('model').save().then () =>
        @set('editMode', false)
