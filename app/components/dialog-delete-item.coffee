import Ember from 'ember'

export default Ember.Component.extend
  selectedItem: null
  actions:
    openDialog: (item) ->
      @set('selectedItem', item)
    closeDialog: () ->
      @set('selectedItem', null)
