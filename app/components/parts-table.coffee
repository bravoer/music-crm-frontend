import Ember from 'ember'
import InstrumentOptions from 'client/config/instrument-options'
import InstrumentPartOptions from 'client/config/instrument-part-options'

export default Ember.Component.extend
  fileService: Ember.inject.service('file')

  sortedParts: Ember.computed.sort 'parts', (a, b) ->
    refArray = InstrumentOptions.get('all')
    sort = refArray.indexOf(a.get('instrument')) - refArray.indexOf(b.get('instrument'))
    if sort == 0
      refArray = InstrumentPartOptions.get('options')
      sort = refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))
    return sort

  actions:
    delete: (part) ->
      @get('fileService').deleteFile(part.get('file'))
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) ->
        part.destroyRecord()
    download: (part) ->
      @get('fileService').downloadFile(part)
