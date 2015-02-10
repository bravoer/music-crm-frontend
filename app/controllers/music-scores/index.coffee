`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`

MusicScoresIndexController = Ember.Controller.extend
  instruments: InstrumentOptions.get('instruments')
  instrument: 'euphonium'
  
`export default MusicScoresIndexController`
