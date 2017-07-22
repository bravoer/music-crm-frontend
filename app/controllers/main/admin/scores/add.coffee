import Ember from 'ember'

export default Ember.Controller.extend
  paperToaster: Ember.inject.service()
  actions:
    cancel: () ->
      @get('model').deleteRecord()
      @transitionToRoute 'main.admin.scores.index'
    save: () ->
      @get('model').save().then (score) =>
        @get('paperToaster').show("#{@get('model.title')} aangemaakt", { position: 'top right' })
        @transitionToRoute 'main.admin.scores.edit', score
