`import Ember from 'ember'`

MusiciansTableComponent = Ember.Component.extend
  exportService: Ember.inject.service('export')
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  # dummy filter such that view gets updated if an item is deleted
  filteredMusicians: Ember.computed 'musicians.[]', () ->
    musicians = @get('musicians').filterBy('created')
    musicians.meta = @get('musicians.meta')
    musicians
  actions:
    delete: (contacts, datatable) ->
      datatable.clearSelection()
      contacts.forEach (contact) ->
        contact.get('address').then (address) ->
          address.destroyRecord() if address
        contact.get('telephones').then (telephones) ->
          telephones.forEach (tel) ->
            tel.destroyRecord() if tel
        contact.destroyRecord()
    export: () ->
      @get('exportService').exportMusicians(@get('group'))

`export default MusiciansTableComponent`
