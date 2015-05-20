`import Ember from 'ember'`

FileManagerMixin = Ember.Mixin.create
  createDocument: (file) ->
    formData = new FormData()
    formData.append 'file', file

    request = Ember.$.ajax
      url: "/files"
      type: "POST"
      data: formData
      processData: false # tell jQuery not to process the data
      contentType: false # tell jQuery not to set contentType      

    request.then (data) ->
      data.file.href
    , (error, status, request) ->
      null
    
  deleteDocument: (url) ->
    id = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."))
    Ember.$.ajax
      url: "/files/#{id}"
      type: "DELETE"

`export default FileManagerMixin`
