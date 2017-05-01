`import Ember from 'ember'`
`import ContactPrefixOptions from 'client/config/contact-prefix-options'`

SympathizerFormComponent = Ember.Component.extend ContactPrefixOptions,
  prefixes: ContactPrefixOptions.get('prefixes')
  communicationOnPaper: Ember.computed 'sympathizer.communication', ->
    @get('sympathizer.communication') == 'paper'
  actions:
    updateCommunication: ->
      communication = if @get('communicationOnPaper') then 'paper' else 'email'
      @set('sympathizer.communication', communication)

`export default SympathizerFormComponent`
