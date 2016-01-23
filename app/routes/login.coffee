`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
  session: Ember.inject.service('session')
  model: ->
    nickname: null
    password: null
  activate: ->
    Ember.$('body').addClass('login-body')
  deactivate: ->
    Ember.$('body').removeClass('login-body')
  actions:
    login: ->
      credentials = @get('controller.model')
      @get('session').authenticate('authenticator:mu-semtech', credentials)
    sessionAuthenticated: -> 
      console.log 'Login succeeded'
      return true
    # sessionAuthenticationFailed: (error) ->
    #   console.log 'Login failed'
    #   message = JSON.parse(error.responseText).errors[0].title
    #   @set('controller.errorMessage', message)
        
`export default LoginRoute`
