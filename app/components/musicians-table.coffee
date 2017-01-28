`import Ember from 'ember'`

MusiciansTableComponent = Ember.Component.extend
  dateFormat: 'DD/MM/YYYY hh:mm:ss'
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

`export default MusiciansTableComponent`
