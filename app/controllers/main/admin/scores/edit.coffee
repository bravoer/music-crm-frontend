`import Ember from 'ember'`

MainAdminScoresEditController = Ember.Controller.extend
  editMode: false

  actions:
    cancelEdit: () ->
      @get('model').rollbackAttributes()
      @set('editMode', false)
    toggleEdit: ->
      @toggleProperty('editMode')
    back: ->
      @transitionToRoute 'main.admin.scores.index', @get('model.status')

`export default MainAdminScoresEditController`
