import Ember from 'ember'

export default Ember.Controller.extend
  actions:
    cancel: () ->
      @get('model').deleteRecord()
      @transitionToRoute 'main.admin.scores.index'
    save: () ->
      @get('model').save().then (score) =>
        @transitionToRoute 'main.admin.scores.edit', score
