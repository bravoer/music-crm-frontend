`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`

MusicScoresIndexController = Ember.ArrayController.extend
  sortProperties: ['title']
  instruments: InstrumentOptions.get('instruments')
  scoresWithFilteredParts: Ember.computed 'instrument', 'model', ->
    @get('model').map (score) =>
      parts = score.get('musicParts').filterBy 'instrument', @get 'instrument'
      score.set('filteredMusicParts', parts)
    .sortBy 'title'
  
`export default MusicScoresIndexController`
