`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`

PartUploadComponent = Ember.Component.extend
  store: Ember.inject.service()
  fileService: Ember.inject.service('file')

  instruments: InstrumentOptions.get('all')
  instrumentParts: InstrumentPartOptions.get('options')

  uploadFinished: Ember.observer 'file', ->
    Ember.Logger.debug('Upload finished observed: ' + JSON.stringify(@get('file')))
    part = @get('store').createRecord 'part',
      file: @get('file.self')
      name: @get('file.name')
    @set('part', part)
    @set('errorMessage', null)
  uploadError: Ember.observer 'error', ->
    Ember.Logger.debug('File upload error received')
    if @get('error.status') == 413
      @set('errorMessage', 'Bestand is te groot')
    else
      @set('errorMessage', 'Er is iets misgelopen')

  actions:
    save: () ->
      Ember.Logger.debug('Save action should happen here')
      @set('part.score', @get('score'))
      @get('part').save().then =>
        Ember.Logger.info('Part uploaded')
        @set('part', null)
      , (error) ->
        Ember.Logger.warn('Something went wrong while saving the part. Error: ' + error)
    cancel: () ->
      @get('fileService').deleteFile(@get('part.file'))
      @get('part').destroyRecord()
      @set('part', null)

`export default PartUploadComponent`
