`import Ember from 'ember'`

instruments = [
  'soprano'
  'cornet'
  'flugelhorn'
  'althorn'
  'bariton'
  'trombone'
  'euphonium'
  'bass_eb'
  'bass_bb'
  'percussion'
]

Options = Ember.Object.create
  instruments: instruments
  all: instruments.concat ['conductor']

`export default Options`
