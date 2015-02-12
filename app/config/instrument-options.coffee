`import Ember from 'ember'`

instruments = [
  'soprano'
  'cornet'
  'flugelhorn'
  'althorn'
  'bariton'
  'euphonium'
  'trombone'
  'bass_bb'
  'bass_eb'
  'percussion'
]

Options = Ember.Object.create
  instruments: instruments
  all: instruments.concat ['conductor']

`export default Options`
