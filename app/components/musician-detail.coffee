import Ember from 'ember'

export default Ember.Component.extend
  paperToaster: Ember.inject.service()
  selectedMusician: null
  isDeleting: false
  actions:
    delete: (musician) ->
      @set('isDeleting', true)
      name = musician.get('name')
      musician.get('address').then (address) ->
        address.destroyRecord()
      musician.get('telephones').then (telephones) ->
        telephones.forEach (telephone) -> telephone.destroyRecord()
      musician.destroyRecord().then () =>
        @get('paperToaster').show("#{name} verwijderd", { position: 'top right' })
        @set('selectedMusician', null)
        @set('isDeleting', false)
        @get('cancel')()
