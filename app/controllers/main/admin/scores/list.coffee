import Ember from 'ember'

export default Ember.Controller.extend
  tabs: [
    { id: 'active', title: 'Muziekstukken' }
    { id: 'archive', title: 'Archief' }
  ]
  activeTab: 'active'
  tabChanged: Ember.observer 'activeTab', ->
    @transitionToRoute("main.admin.scores.list.#{@get('activeTab')}")
