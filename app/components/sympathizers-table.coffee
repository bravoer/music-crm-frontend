`import Ember from 'ember'`

SympathizersTableComponent = Ember.Component.extend
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
  # dummy filter such that view gets updated if an item is deleted
  filteredSympathizers: Ember.computed 'sympathizers.[]', () ->
    @get('sympathizers').filterBy('created')
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

`export default SympathizersTableComponent`
