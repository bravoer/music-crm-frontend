`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`

PartCreateModalComponent = Ember.Component.extend
  instruments: InstrumentOptions.get('all')
  instrumentParts: InstrumentPartOptions.get('options')
  clefs: ClefOptions.get('options')
  keys: KeyOptions.get('options')

  actions:
    addFile: (file) ->
      @sendAction('addFile', file, @get('part'))
    savePart: ->
      @set 'isOpen', false
      @sendAction('savePart', @get('score'), @get('part'))
    close: ->
      @set 'isOpen', false
      return false

`export default PartCreateModalComponent`
