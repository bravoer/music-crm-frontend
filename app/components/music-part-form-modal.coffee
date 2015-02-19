`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`
`import FileManager from 'client/mixins/file-manager'`

MusicPartFormModalComponent = Ember.Component.extend FileManager,
  init: ->
    @_super()
    @resetDefaults()

  resetDefaults: ->
    @set 'instrument', 'cornet'
    @set 'instrumentPart', '1st'
    @set 'clef', 'G-clef'
    @set 'key', 'Bb'
    @set 'file', null

  instruments: InstrumentOptions.get('all')
  instrumentParts: InstrumentPartOptions.get('options')
  clefs: ClefOptions.get('options')
  keys: KeyOptions.get('options')

  handleFileChange: (event) ->
    file = event.target.files[0] ? null
    @set 'uploadedFile', file

  didInsertElement: ->
    handleFileChange = Ember.run.bind(@, @handleFileChange)

    # JS for Materialize CSS
    Ember.$('.file-field').each ->
      path_input = $(@).find('input.file-path')
      Ember.$(@).find('input[type="file"]').change ->
        path_input.val($(@).val())
        path_input.trigger('change')
        
    Ember.$('.file-field input[type="file"]').change (event) -> handleFileChange(event)

  actions:
    save: ->
      @createDocument(@get('uploadedFile')).then (file) =>
        @set 'file', file
        @sendAction('action', @getProperties('instrument', 'instrumentPart', 'clef', 'key', 'file'))
        @resetDefaults()
          
`export default MusicPartFormModalComponent`
