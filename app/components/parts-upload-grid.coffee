import Ember from 'ember'

export default Ember.Component.extend
  classNames: ['parts-upload-grid']
  options: Ember.inject.service()
  grid: Ember.computed 'options', ->
    @get('options').partsPerInstrument()
