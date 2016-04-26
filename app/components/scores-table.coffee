`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  rows: Ember.computed 'scores', 'scores.@each.status', ->
    expectedStatus = if @get('archived') then 'archived' else 'active'
    @get('scores').filterBy('status', expectedStatus).map (score) =>
      score.set('translatedGenre', @i18n.t(score.get('genre'))) if score.get('genre')
      score
  columns: [
    { field: 'title', label: 'Titel', sortable: true }
    { field: 'composer', label: 'Componist', sortable: true }
    { field: 'arranger', label: 'Arrangeur', sortable: true }
    { field: 'translatedGenre', label: 'Genre', sortable: true }
    { field: 'parts.length', label: '# Partituren' }
    { field: 'created', label: 'Aangemaakt', sortable: true, isDate: true }
    { field: 'modified', label: 'Gewijzigd', sortable: true, isDate: true }
  ]
  headerMenu: [
    { link: 'main.admin.scores.add', label: 'Nieuw' }
  ]
  selectionMenu: Ember.computed 'archived', ->
    [
      { action: 'toggleArchive', label: 'Activeer' } if @get('archived')
      { action: 'toggleArchive', label: 'Archiveer' } unless @get('archived')
      { action: 'delete', label: 'Verwijder' }
    ]
  contextMenu: [
    { action: 'info', label: 'Details' }
    { link: 'main.admin.scores.edit', label: 'Bewerk' }
    { action: 'attach', label: 'Bestand toevoegen' } 
  ]
  actions:
    toggleArchive: (scores) ->
      Ember.changeProperties () ->
        scores.forEach (score) ->
          toggledStatus = if score.get('isActive') then 'archived' else 'active'
          score.setProperties( { status: toggledStatus, modified: new Date() } )
          score.save()
    delete: (scores) ->
      @sendAction('delete', scores)
    info: (score) ->
      @sendAction('info', score)
    attach: (score) ->
      @sendAction('attach', score)

`export default ScoresTableComponent`
