`import Ember from 'ember'`

MainController = Ember.Controller.extend
  session: Ember.inject.service('session')

`export default MainController`
