`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
  activate: ->
    Ember.$('body').addClass('login-body')
  deactivate: ->
    Ember.$('body').removeClass('login-body')
        
`export default LoginRoute`
