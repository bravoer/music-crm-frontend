`import Ember from 'ember'`
`import EmberUploader from 'ember-uploader'`

FileUploadComponent = EmberUploader.FileField.extend
  filesDidChange: (files) ->
    @set('isLoading', true)
    uploader = EmberUploader.Uploader.create
      url: '/files'
    uploader.upload(files[0]).then (response) =>
      @set('isLoading', false)
      @set('file', { self: response.links.self, name: files[0].name})
    , (error) =>
      Ember.Logger.warn('File upload error')
      @set('isLoading', false)
      @set('error', error)

`export default FileUploadComponent`
