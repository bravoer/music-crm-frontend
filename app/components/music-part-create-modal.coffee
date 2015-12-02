`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`

MusicPartCreateModalComponent = Ember.Component.extend
  instruments: InstrumentOptions.get('all')
  instrumentParts: InstrumentPartOptions.get('options')
  clefs: ClefOptions.get('options')
  keys: KeyOptions.get('options')

  actions:
    addFile: (file) ->
      console.log 'add file action in modal'
      @sendAction('addFile', file, @get('musicPart'))
    savePart: ->
      console.log 'save part action in modal'
      @set 'isOpen', false
      @sendAction('savePart', @get('score'), @get('musicPart'))
    close: ->
      @set 'isOpen', false
      return false

`export default MusicPartCreateModalComponent`
