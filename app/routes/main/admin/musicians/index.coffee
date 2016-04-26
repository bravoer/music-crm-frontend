`import Ember from 'ember'`

AdminMusiciansIndexRoute = Ember.Route.extend
  model: (params) ->
    @store.query 'musician', {
      page:
        number: params.page
        size: params.size
      sort: params.sort
    }
  queryParams:
    page:
      refreshModel: true
    size:
      refreshModel: true
    sort:
      refreshModel: true
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
