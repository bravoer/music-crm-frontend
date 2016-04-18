`import Ember from 'ember'`

MusiciansTableComponent = Ember.Component.extend
  columns: [
    { field: 'prefix', label: 'Titel' }
    { field: 'firstName', label: 'Voornaam', sortable: true }
    { field: 'lastName', label: 'Achternaam', sortable: true }
    { field: 'instrument', label: 'Instrument', sortable: true }
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


`export default MusiciansTableComponent`
