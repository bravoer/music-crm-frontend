import Ember from 'ember'

export default Ember.Route.extend
  session: Ember.inject.service()
  beforeModel: ->
    @transitionTo('main') unless @get('session.data.isBoard') or @get('session.data.isAdmin')
