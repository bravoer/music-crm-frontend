`import Ember from 'ember'`

FileManagerMixin = Ember.Mixin.create
  createFile: (file) ->
    formData = new FormData()
    formData.append 'file', file

    request = Ember.$.ajax
      url: "/files"
      type: "POST"
      data: formData
      processData: false # tell jQuery not to process the data
      contentType: false # tell jQuery not to set contentType      

    request.then (data) ->
      data
    , (error, status, request) ->
      null
    
  deleteFile: (url) ->
    id = url.substring(url.lastIndexOf("/") + 1)
    Ember.$.ajax
      url: "/files/#{id}"
      type: "DELETE"

`export default FileManagerMixin`
