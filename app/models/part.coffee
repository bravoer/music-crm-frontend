`import Ember from 'ember'`
`import Resource from 'ember-jsonapi-resources/models/resource'`
`import { attr, hasOne, hasMany } from 'ember-jsonapi-resources/models/resource'`

Part = Resource.extend
  type: 'parts'
  service: Ember.inject.service('parts')

  name: attr()
  instrument: attr()
  instrumentPart: attr()
  key: attr()
  clef: attr()
  file: attr()

  score: hasOne('score')

`export default Part`
