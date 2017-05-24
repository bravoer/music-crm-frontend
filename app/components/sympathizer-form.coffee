import Ember from 'ember'
import ContactPrefixOptions from 'client/config/contact-prefix-options'

export default Ember.Component.extend ContactPrefixOptions,
  prefixes: [{ label: '-', value: ''}].concat(ContactPrefixOptions.get('prefixes').map (prefix) -> { label: prefix, value: prefix })
  communicationOnPaper: Ember.computed 'sympathizer.communication', ->
    @get('sympathizer.communication') == 'paper'
  actions:
    updateCommunication: ->
      communication = if @get('communicationOnPaper') then 'paper' else 'email'
      @set('sympathizer.communication', communication)
