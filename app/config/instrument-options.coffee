`import Ember from 'ember'`

Options = Ember.Object.create
  instruments: [
    { label: 'Soprano', value: 'soprano' }
    { label: 'Cornet', value: 'cornet' }
    { label: 'Flugel', value: 'flugelhorn' }
    { label: 'Alto', value: 'althorn' }
    { label: 'Bariton', value: 'bariton' }
    { label: 'Euphonium', value: 'euphonium' }
    { label: 'Trombone', value: 'trombone' }
    { label: 'Bas Bb', value: 'bass_bb' }
    { label: 'Bas Eb', value: 'bass_eb' }
    { label: 'Slagwerk', value: 'percussion' }
  ]
  instrumentsOptional: ->
    [{ label: '', value: '' }].concat @get('instruments')
  all: ->
    @get('instruments').concat [{ label: 'Dirigent', value: 'conductor' }]

`export default Options`
