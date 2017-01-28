`import Ember from 'ember'`

MainAdminMusiciansEditController = Ember.Controller.extend
  editMode: false

  actions:
    cancelEdit: () ->
      @get('model').rollbackAttributes()
      @get('model.address').then (address) -> address.rollbackAttributes()
      @get('model.telephones').then (telephones) ->
        telephones.forEach (tel) -> tel.rollbackAttributes()
      @set('editMode', false)
    toggleEdit: ->
      @toggleProperty('editMode')
      false
    back: ->
      @transitionToRoute 'main.admin.musicians.index'

`export default MainAdminMusiciansEditController`
