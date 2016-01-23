`import Ember from 'ember'`
`import Base from 'ember-simple-auth/authenticators/base'`

MuSemtechAuthenticator = Base.extend
  restore: (data) ->
    Ember.RSVP.reject()
  authenticate: (options) ->
    Ember.$.ajax
      url: '/sessions'
      type: 'POST'
      dataType: 'json'
      headers:
        'Content-Type': 'application/vnd.api+json'
      data: JSON.stringify
        data:
          type: 'sessions'
          attributes:
            nickname: options['nickname']
            password: options['password']
  invalidate: (session) ->
    Ember.$.ajax
      url: 'sessions/current'
      type: 'DELETE'
      headers:
        'Content-Type': 'application/vnd.api+json'
    
`export default MuSemtechAuthenticator`
