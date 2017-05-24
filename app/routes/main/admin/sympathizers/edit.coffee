import Ember from 'ember'

export default Ember.Route.extend
  model: (params) ->
    @store.findRecord 'sympathizer', params.id
  actions:
    save: () ->
      contact = @modelFor('main.admin.sympathizers.edit')
      promises = []
      contact.get('address').then (address) =>
        promises.push(address.save()) if address.get('hasDirtyAttributes')
        contact.get('telephones').then (telephones) =>
          telephones.forEach (tel) ->
            promises.push(tel.save()) if tel.get('hasDirtyAttributes')
          if promises.length > 0 or contact.get('hasDirtyAttributes')
            contact.set('modified', new Date())
            promises.push(contact.save())
          Ember.RSVP.Promise.all(promises).then () =>
            @controllerFor('main.admin.sympathizers.edit').set('editMode', false)
