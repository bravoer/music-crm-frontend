`import Ember from 'ember'`

MainAdminMusiciansAddRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'musician',
      address: @store.createRecord 'address'
      telephones: Ember.A [@store.createRecord 'telephone']
  actions:
    save: ->
      contact = @modelFor('main.admin.musicians.add')
      contact.get('address').then (address) =>
        promises = [address.save()]
        contact.get('telephones').then (telephones) =>
          telephones.forEach (tel) -> promises.push(tel.save())
          Ember.RSVP.Promise.all(promises).then () =>
            contact.set('modified', new Date())
            contact.save().then =>
              @transitionTo 'main.admin.musicians.index'
    cancel: ->
      contact = @modelFor('main.admin.musicians.add')
      contact.rollbackAttributes()
      @transitionTo 'main.admin.musicians.index'

`export default MainAdminMusiciansAddRoute`
