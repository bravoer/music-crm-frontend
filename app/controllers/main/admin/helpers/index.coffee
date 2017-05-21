`import Ember from 'ember'`

MainAdminHelpersIndexController = Ember.Controller.extend
  actions:
    addEvent: (event) ->
      @send('invalidateModel')

`export default MainAdminHelpersIndexController`
