import Ember from 'ember'

export default Ember.Component.extend
  file: Ember.inject.service()
  options: Ember.inject.service()
  filteredParts: Ember.computed 'score.parts', 'instrument', ->
    parts = @get('score.parts').filterBy('instrument', @get('instrument'))
    @get('options').sortInstrumentParts(parts)
  actions:
    download: (part) ->
      @get('file').downloadFile(part)
