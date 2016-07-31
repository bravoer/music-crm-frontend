`import Ember from 'ember'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import FileManager from 'client/mixins/file-manager'`

DownloadScorePerInstrumentCardComponent = Ember.Component.extend FileManager,
  filteredParts: Ember.computed 'score.parts', 'instrument', ->
    parts = @get('score.parts').filterBy('instrument', @get('instrument'))
    refArray = InstrumentPartOptions.get('options')
    parts.sort (a,b) =>
      refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))

  actions:
    download: (part) ->
      @downloadFile part.get('file'), part.get('downloadFileName')

`export default DownloadScorePerInstrumentCardComponent`
