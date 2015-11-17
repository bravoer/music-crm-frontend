`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`

EditScoreComponent = Ember.Component.extend
  instruments: InstrumentOptions.get('all')
  instrumentParts: InstrumentPartOptions.get('options')
  clefs: ClefOptions.get('options')
  keys: KeyOptions.get('options')

  actions:
    cancel: ->
      @sendAction('cancel')
    addPart: (file) ->
      @sendAction('addPart', file)
    deletePart: (part) ->
      @sendAction('deletePart', part)
    toggleEditPart: (part) ->
      @sendAction('toggleEditPart', part)
      
`export default EditScoreComponent`
