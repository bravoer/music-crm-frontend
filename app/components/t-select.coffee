`import Ember from 'ember'`

TSelectComponent = Ember.Component.extend
  required: false
  content: Ember.computed 'options', 'required', ->
    if @get('options')
      options = if @get('required') then [] else [{ label: '', key: ''}]
      options.concat( @get('options').map (key) => { label: @t(key), value: key } )

`export default TSelectComponent`
