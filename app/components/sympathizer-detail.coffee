import Ember from 'ember'

export default Ember.Component.extend
  paperToaster: Ember.inject.service()
  selectedSympathizer: null
  isDeleting: false
  actions:
    delete: (sympathizer) ->
      @set('isDeleting', true)
      name = sympathizer.get('name')
      sympathizer.get('address').then (address) ->
        address.destroyRecord()
      sympathizer.get('telephones').then (telephones) ->
        telephones.forEach (telephone) -> telephone.destroyRecord()
      sympathizer.destroyRecord().then () =>
        @get('paperToaster').show("#{name} verwijderd", { position: 'top right' })
        @set('selectedSympathizer', null)
        @set('isDeleting', false)
        @get('cancel')()
