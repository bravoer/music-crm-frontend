`import Ember from 'ember'`

MainAdminMusiciansEditRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord 'musician', params.id
  actions:
    save: () ->
      musician = @modelFor('main.admin.musicians.edit')
      promises = []
      musician.get('address').then (address) =>
        promises.push(address.save()) if address.get('hasDirtyAttributes')
        musician.get('telephones').then (telephones) =>
          telephones.forEach (tel) ->
            promises.push(tel.save()) if tel.get('hasDirtyAttributes')
          if promises.length > 0 or musician.get('hasDirtyAttributes')
            musician.set('modified', new Date())
            promises.push(musician.save())
          Ember.RSVP.Promise.all(promises).then () =>
            @controllerFor('main.admin.musicians.edit').set('editMode', false)

`export default MainAdminMusiciansEditRoute`
