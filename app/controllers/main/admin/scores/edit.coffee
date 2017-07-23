import Ember from 'ember'

export default Ember.Controller.extend
  queryParams: ['editMode']
  editMode: false
  paperToaster: Ember.inject.service()
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
        @get('paperToaster').show("#{@get('model.title')} opgeslagen", { position: 'top right' })
        @set('editMode', false)
