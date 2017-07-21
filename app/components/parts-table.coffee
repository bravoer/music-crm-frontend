import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  file: Ember.inject.service()
  sortedParts: Ember.computed 'content.[]', 'options', ->
    @get('options').sortInstrumentParts(@get('content'))
  actions:
    delete: (part) ->
      @get('file').deleteFile(part)
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) =>
        part.destroyRecord()
    download: (part) ->
      @get('file').downloadFile(part)
