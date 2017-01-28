`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import ContactPrefixOptions from 'client/config/contact-prefix-options'`

MusicianFormComponent = Ember.Component.extend InstrumentOptions, ContactPrefixOptions,
  instruments: InstrumentOptions.get('all')
  prefixes: ContactPrefixOptions.get('prefixes')
  actions:
    updateBirthdate: (birthdate, valid) ->
      @set('musician.birthdate', birthdate)

`export default MusicianFormComponent`
