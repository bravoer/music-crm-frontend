`import Ember from 'ember'`

MainIndexRoute = Ember.Route.extend
  activate: ->
    Ember.$('body').addClass('homepage')
  deactivate: ->
    Ember.$('body').removeClass('homepage')

`export default MainIndexRoute`
