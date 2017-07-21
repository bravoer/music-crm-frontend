import Ember from 'ember'

export default Ember.Service.extend
  deleteFile: (part) ->
    url = part.get('file')
    id = url.substring(url.lastIndexOf('/') + 1)
    Ember.$.ajax
      url: "/files/#{id}"
      type: 'DELETE'
  downloadFile: (part) ->
    url = part.get('file') + '/download'
    name = part.get('downloadFileName')
    url += "?name=#{name}" if name
    window.location = url
