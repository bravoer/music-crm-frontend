`import Ember from 'ember'`

TLabelComponent = Ember.Component.extend
  tagName: 'span'
  label: Ember.computed 'value', ->
    if @get('value') then @i18n.t(@get('value')) else null

`export default TLabelComponent`
