`import Ember from 'ember'`

FileManagerMixin = Ember.Mixin.create
  createDocument: (file) ->
    formData = new FormData()
    formData.append 'file', file

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
    
  deleteDocument: (url) ->
    id = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."))
    Ember.$.ajax
      url: "/bravoer/documents/#{id}"
      type: "DELETE"

`export default FileManagerMixin`
