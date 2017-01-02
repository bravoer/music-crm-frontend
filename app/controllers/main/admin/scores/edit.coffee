`import Ember from 'ember'`

MainAdminScoresEditController = Ember.Controller.extend
  editMode: false

  actions:
    cancelEdit: () ->
      @get('model').rollbackAttributes()
      @set('editMode', false)
    toggleEdit: ->
      @toggleProperty('editMode')
      false
    back: ->
      @transitionToRoute 'main.admin.scores.index', 'all'

`export default MainAdminScoresEditController`
