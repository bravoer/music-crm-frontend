`import Ember from 'ember'`

MainAdminSympathizersAddRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'sympathizer',
      address: @store.createRecord 'address'
      telephones: Ember.A [@store.createRecord 'telephone']
  actions:
    save: ->
      contact = @modelFor('main.admin.sympathizers.add')
      contact.get('address').then (address) =>
        promises = [address.save()]
        contact.get('telephones').then (telephones) =>
          telephones.forEach (tel) => promises.push(tel.save())
          Ember.RSVP.Promise.all(promises).then () =>
            contact.set('modified', new Date())
            contact.save().then =>
              @transitionTo 'main.admin.sympathizers.index'
    cancel: ->
      contact = @modelFor('main.admin.sympathizers.add')
      contact.rollbackAttributes()
      @transitionTo 'main.admin.sympathizers.index'

`export default MainAdminSympathizersAddRoute`
