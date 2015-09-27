`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
  model: ->
    nickname: null
    password: null
  actions:
    login: ->
      credentials = @get('controller.model')
      @get('session').authenticate('authenticator:mu-semtech', credentials)
    sessionAuthenticationSucceeded: -> 
      console.log 'Login succeeded'
      return true
    sessionAuthenticationFailed: (error) ->
      console.log 'Login failed'
      message = JSON.parse(error.responseText).errors[0].title
      @set('controller.errorMessage', message)
        
`export default LoginRoute`
