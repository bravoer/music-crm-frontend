import Ember from 'ember'

export default Ember.Controller.extend
  actions:
    goToDetail: (row) ->
      @transitionToRoute 'main.admin.sympathizers.edit', row
