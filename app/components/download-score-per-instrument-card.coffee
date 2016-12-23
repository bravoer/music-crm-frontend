`import Ember from 'ember'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`

DownloadScorePerInstrumentCardComponent = Ember.Component.extend
  fileService: Ember.inject.service('file')

  filteredParts: Ember.computed 'score.parts', 'instrument', ->
    parts = @get('score.parts').filterBy('instrument', @get('instrument'))
    refArray = InstrumentPartOptions.get('options')
    parts.sort (a, b) ->
      refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))

  actions:
    download: (part) ->
      @get('fileService').downloadFile(part)

`export default DownloadScorePerInstrumentCardComponent`
