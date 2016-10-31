`import Ember from 'ember'`
`import DataTableRouteMixin from 'ember-data-table/mixins/route'`

AdminMusiciansIndexRoute = Ember.Route.extend DataTableRouteMixin,
  modelName: 'musician'
  actions:
    deleteMusicians: (contacts) ->
      contacts.forEach (contact) ->
        contact.get('address').then (address) ->
          address.destroyRecord() if address
        contact.get('telephones').then (telephones) ->
          telephones.forEach (tel) ->
            tel.destroyRecord() if tel
        contact.destroyRecord()

`export default AdminMusiciansIndexRoute`
