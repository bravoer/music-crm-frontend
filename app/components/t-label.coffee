`import Ember from 'ember'`

TLabelComponent = Ember.Component.extend
  tagName: 'span'
  label: Ember.computed 'value', ->
    if @get('value') then @get('value') else null

`export default TLabelComponent`
