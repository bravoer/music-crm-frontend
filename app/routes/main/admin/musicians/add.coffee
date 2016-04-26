`import Ember from 'ember'`

AdminMusiciansAddRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'musician',
      address: @store.createRecord 'address'
      telephones: Ember.A [@store.createRecord 'telephone']
  actions:
    save: ->
      contact = @modelFor('main.admin.musicians.add')
      contact.get('address.content').save().then (address) =>
        Ember.RSVP.Promise.all(contact.get('telephones').map (telephone) -> telephone.save()).then (telephones) =>
          contact.set('modified', new Date())
          contact.save().then =>
            @transitionTo 'main.admin.musicians.index'
    cancel: ->
      contact = @modelFor('main.admin.musicians.add')
      contact.rollbackAttributes()
      @transitionTo 'main.admin.musicians.index'

`export default AdminMusiciansAddRoute`
