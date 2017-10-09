import Ember from 'ember'

export default Ember.Route.extend
  session: Ember.inject.service()
  beforeModel: ->
    @transitionTo('main') if @get('session.data.isGuest')
