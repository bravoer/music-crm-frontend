import Ember from 'ember'

export default Ember.Service.extend
  ajax: Ember.inject.service()
  deleteFile: (part) ->
    url = part.get('file')
    id = url.substring(url.lastIndexOf('/') + 1)
    @get('ajax').del("/files/#{id}")
  downloadFile: (part) ->
    url = part.get('file') + '/download'
    name = part.get('downloadFileName')
    url += "?name=#{name}" if name
    window.location = url
