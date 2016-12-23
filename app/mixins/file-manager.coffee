`import Ember from 'ember'`

FileManagerMixin = Ember.Mixin.create
  deleteFile: (url) ->
    id = url.substring(url.lastIndexOf('/') + 1)
    Ember.$.ajax
      url: "/files/#{id}"
      type: 'DELETE'

  downloadFile: (file, name) ->
    url = file + '/download'
    url += "?name=#{name}" if name
    window.location = url

`export default FileManagerMixin`
