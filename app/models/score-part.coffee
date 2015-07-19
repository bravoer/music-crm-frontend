`import Ember from 'ember'`
`import Resource from 'ember-jsonapi-resources/models/resource'`
`import { attr, hasOne, hasMany } from 'ember-jsonapi-resources/models/resource'`

ScorePart = Resource.extend
  type: 'score-parts'
  service: Ember.inject.service('score-parts')

  instrument: attr()
  instrumentPart: attr()
  key: attr()
  clef: attr()
  file: attr()

  score: hasOne('score')

`export default ScorePart`
