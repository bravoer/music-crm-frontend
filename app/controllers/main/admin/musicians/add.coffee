`import Ember from 'ember'`
`import InstrumentOptions from 'client/config/instrument-options'`
`import ContactPrefixOptions from 'client/config/contact-prefix-options'`

AdminMusiciansAddController = Ember.Controller.extend InstrumentOptions, ContactPrefixOptions,
  instruments: InstrumentOptions.get('all')
  prefixes: ContactPrefixOptions.get('prefixes')
  
`export default AdminMusiciansAddController`
