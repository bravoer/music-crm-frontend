`import Ember from 'ember'`
`import Resource from 'ember-jsonapi-resources/models/resource'`
`import { attr, hasOne, hasMany } from 'ember-jsonapi-resources/models/resource'`

Part = Resource.extend
  type: 'parts'
  service: Ember.inject.service('parts')

  name: attr()
  instrument: attr()
  instrumentPart: Ember.computed.alias 'instrument-part' 
  'instrument-part': attr()
  key: attr()
  clef: attr()
  file: attr()

  score: hasOne('score')

  description: Ember.computed 'instrument', 'instrumentPart', 'key', 'clef', ->
    description = ""
    description += "#{@i18n.t(@get('instrumentPart'))}" if @get('instrumentPart')
    description += " #{@i18n.t(@get('instrument'))}" if @get('instrument')
    description += " #{@i18n.t(@get('key'))}" if @get('key')
    description += " (#{@i18n.t(@get('clef'))})" if @get('clef')
    description || @get('name')

`export default Part`
