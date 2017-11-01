import Ember from 'ember'

export default Ember.Controller.extend
  paperToaster: Ember.inject.service()
  actions:
    addHelper: (helper) ->
      if helper
        @get('model.helpers').pushObject(helper)
        @get('model').save().then (event) =>
          event.hasMany('helpers').reload() # required to update the data-table total count
          @get('paperToaster').show("#{helper.get('name')} toegevoegd", { position: 'top right' })
    goToDetail: (row) ->
      @transitionToRoute 'main.admin.sympathizers.edit', row
