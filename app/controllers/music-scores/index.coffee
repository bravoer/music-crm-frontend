`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`

MusicScoresIndexController = Ember.Controller.extend
  instruments: InstrumentOptions.get('instruments')
  instrument: 'euphonium'
  activeScores: Ember.computed 'instrument', 'model', ->
    activeScores = @get('model').filterBy 'status', 'active'
    activeScores.map (score) =>
      parts = score.get('musicParts').filterBy 'instrument', @get 'instrument'
      score.set('filteredMusicParts', parts)
  
`export default MusicScoresIndexController`
