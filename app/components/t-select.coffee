`import Ember from 'ember'`

TSelectComponent = Ember.Component.extend
  required: false
  blankLabel: ''
  content: Ember.computed 'options', 'required', ->
    if @get('options')
      options = if @get('required') then [] else [{ label: @get('blankLabel'), key: '' }]
      options.concat( @get('options').map (key) => { label: @t(key), value: key } )

`export default TSelectComponent`
