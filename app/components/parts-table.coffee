`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`

MusicPartsTableComponent = Ember.Component.extend FileManager,
  sortedParts: Ember.computed.sort 'parts', (a, b) ->
    refArray = InstrumentOptions.get('all')
    sort = refArray.indexOf(a.get('instrument')) - refArray.indexOf(b.get('instrument'))
    if sort == 0
      refArray = InstrumentPartOptions.get('options')
      sort = refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))
    return sort

  actions:
    delete: (part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) ->
        part.destroyRecord()
    download: (part) ->
      @downloadFile part.get('file'), part.get('downloadFileName')

`export default MusicPartsTableComponent`
