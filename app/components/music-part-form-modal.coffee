`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`

MusicPartFormModalComponent = Ember.Component.extend
  instruments: InstrumentOptions.get('all')
  instrument: 'cornet'
  instrumentParts: InstrumentPartOptions.get('options')
  instrumentPart: '1st'
  clefs: ClefOptions.get('options')
  clef: 'G-clef'
  keys: KeyOptions.get('options')
  key: 'Bb'

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

  uploadFile: ->
    formData = new FormData()
    formData.append 'file', @get('uploadedFile')

    file = null
    request = Ember.$.ajax
      url: "/bravoer/documents"
      type: "POST"
      data: formData
      processData: false # tell jQuery not to process the data
      contentType: false # tell jQuery not to set contentType      

    request.then (data) ->
      data.document.href
    , (error, status, request) ->
      null 

  actions:
    save: ->
      @uploadFile().then (file) =>
        @set 'file', file
        @sendAction('action', @getProperties('instrument', 'instrumentPart', 'clef', 'key', 'file'))
      
`export default MusicPartFormModalComponent`
