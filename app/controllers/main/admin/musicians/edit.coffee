`import Ember from 'ember'`
`import { translationMacro as t } from 'ember-i18n'`

MainAdminMusiciansEditController = Ember.Controller.extend
  editMode: false

  actions:
    translate: (name) ->
      this.get('i18n').t(name)
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

`export default MainAdminMusiciansEditController`
