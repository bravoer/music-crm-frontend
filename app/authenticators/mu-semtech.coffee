`import Ember from 'ember'`
`import Base from 'simple-auth/authenticators/base'`

MuSemtechAuthenticator = Base.extend
  store: Ember.inject.service 'store'
  restore: (data) ->
    Ember.RSVP.reject()
  authenticate: (options) ->
    session = @container.lookup('model:sessions').create
      isNew: true
      attributes: { nickname: 'john_doe', password: 'secret' }
    @get('store').createResource('sessions', session)
  invalidate: (session) ->
    @store.deleteResource('sessions', session)
    
`export default MuSemtechAuthenticator`
