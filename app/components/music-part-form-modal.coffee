`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`
`import KeyOptions from 'client/config/key-options'`
`import ClefOptions from 'client/config/clef-options'`

MusicPartFormModalComponent = Ember.Component.extend
  instruments: InstrumentOptions.get('all')
  instrument: 'cornet'
  instrumentParts: InstrumentPartOptions.get('options')
  instrumentPart: '1st'
  clefs: ClefOptions.get('options')
  clef: 'G-clef'
  keys: KeyOptions.get('options')
  key: 'Bb'

  didInsertElement: ->
    $('.file-field').each ->
      path_input = $(@).find('input.file-path')
      $(@).find('input[type="file"]').change ->
        path_input.val($(@).val())
        path_input.trigger('change')

  actions:
    save: ->
      @sendAction('action', @getProperties('instrument', 'instrumentPart', 'clef', 'key'))
      
`export default MusicPartFormModalComponent`
