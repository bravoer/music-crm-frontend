import Ember from 'ember'

export default Ember.Controller.extend
  editMode: false

  actions:
    translate: (name) ->
      @get('i18n').t(name)
    cancelEdit: () ->
      @get('model').rollbackAttributes()
      @get('model.address').then (address) -> address.rollbackAttributes()
      @get('model.telephones').then (telephones) ->
        telephones.forEach (tel) -> tel.rollbackAttributes()
      # TODO: groups should also be rollbacked here
      @set('editMode', false)
    toggleEdit: ->
      @toggleProperty('editMode')
      false
    back: ->
      @transitionToRoute 'main.admin.musicians.index'
