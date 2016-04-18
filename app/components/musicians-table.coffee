`import Ember from 'ember'`

MusiciansTableComponent = Ember.Component.extend
  rows: Ember.computed 'musicians', ->
    @get('musicians').map (contact) =>
      contact.set('tPrefix', @i18n.t(contact.get('prefix'))) if contact.get('prefix')
      contact.set('tInstrument', @i18n.t(contact.get('instrument'))) if contact.get('instrument')
      contact
  columns: [
    { field: 'tPrefix', label: 'Titel' }
    { field: 'firstName', label: 'Voornaam', sortable: true }
    { field: 'lastName', label: 'Achternaam', sortable: true }
    { field: 'tInstrument', label: 'Instrument', sortable: true }
    { field: 'email', label: 'Email' }
    { field: 'created', label: 'Aangemaakt', sortable: true, isDate: true }
    { field: 'modified', label: 'Gewijzigd', sortable: true, isDate: true }
  ]
  headerMenu: [
    { link: 'admin.musicians.add', label: 'Nieuw' }
  ]
  selectionMenu: [
    { action: 'delete', label: 'Verwijder' }
  ]
  actions:
    delete: (contacts) ->
      @sendAction('delete', contacts)

`export default MusiciansTableComponent`
