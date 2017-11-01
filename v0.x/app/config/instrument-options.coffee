import Ember from 'ember'

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

export default Ember.Object.create
  instruments: instruments
  all: instruments.concat ['conductor']
