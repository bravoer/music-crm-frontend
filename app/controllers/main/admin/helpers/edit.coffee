`import Ember from 'ember'`

MainAdminHelpersEditController = Ember.Controller.extend
  actions:
    addHelper: (helper) ->
      @get('model.helpers').pushObject(helper)
      @get('model').save()
    deleteHelper: (helper) ->
      @get('model.helpers').removeObject(helper)
      @get('model').save()

`export default MainAdminHelpersEditController`
