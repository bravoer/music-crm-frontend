`import Ember from 'ember'`
`import ContactPrefixOptions from 'client/config/contact-prefix-options'`

SympathizerFormComponent = Ember.Component.extend ContactPrefixOptions,
  prefixes: ContactPrefixOptions.get('prefixes')

`export default SympathizerFormComponent`
