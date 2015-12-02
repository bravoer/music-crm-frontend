`import Ember from 'ember'`

MusicPartsTableComponent = Ember.Component.extend
  actions:
    delete: (part) ->
      @sendAction('delete', part)


`export default MusicPartsTableComponent`
