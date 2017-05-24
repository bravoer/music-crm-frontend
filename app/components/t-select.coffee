import Ember from 'ember'

export default Ember.Component.extend
  required: false
  blankLabel: ' '
  content: Ember.computed 'options', 'required', ->
    if @get('options')
      options = if @get('required') then [] else [{ label: @get('blankLabel'), value: null }]
      options.concat( @get('options').map (key) => { label: @i18n.t(key), value: key } )
