`import Ember from 'ember'`

AdminScoresListController = Ember.Controller.extend
  tabs: [
    { id: 'active', title: 'Muziekstukken' }
    { id: 'archive', title: 'Archief' }
  ]
  activeTab: 'active'
  tabChanged: Ember.observer 'activeTab', ->
    @transitionToRoute("admin.scores.list.#{@get('activeTab')}")
    
`export default AdminScoresListController`
