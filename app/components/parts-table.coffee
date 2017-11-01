import Ember from 'ember'

export default Ember.Component.extend
  options: Ember.inject.service()
  file: Ember.inject.service()
  paperToaster: Ember.inject.service()
  sortedParts: Ember.computed 'content.[]', 'options', ->
    @get('options').sortInstrumentParts(@get('content'))
  selectedPart: null
  actions:
    delete: (part) ->
      description = part.get('description')
      @get('file').deleteFile(part)
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) =>
        part.destroyRecord().then () =>
          @get('paperToaster').show("#{description} verwijderd", { position: 'top right' })
      @set('selectedPart', null)
    download: (part) ->
      @get('file').downloadFile(part)
