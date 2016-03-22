`import Ember from 'ember'`

TRadiosComponent = Ember.Component.extend
  content: Ember.computed 'options', ->
    if @get('options')
      options = @get('options').map (key) => { label: @i18n.t(key), value: key }

`export default TRadiosComponent`