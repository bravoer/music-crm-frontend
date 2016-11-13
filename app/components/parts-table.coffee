`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`

MusicPartsTableComponent = Ember.Component.extend
  sortedParts: Ember.computed.sort 'parts', (a, b) ->
    refArray = InstrumentOptions.get('all')
    sort = refArray.indexOf(a.get('instrument')) - refArray.indexOf(b.get('instrument'))
    if sort == 0
      refArray = InstrumentPartOptions.get('options')
      sort = refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))
    return sort

  actions:
    delete: (part) ->
      @sendAction('delete', part)
    download: (part) ->
      @sendAction('download', part)


`export default MusicPartsTableComponent`
