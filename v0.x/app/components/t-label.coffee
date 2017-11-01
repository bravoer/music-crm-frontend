import Ember from 'ember'

###
# Component to render the translation of a value
###
export default Ember.Component.extend
  tagName: 'span'
  label: Ember.computed 'value', ->
    if @get('value') then @i18n.t(@get('value')) else null
