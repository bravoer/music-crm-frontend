`import Ember from 'ember'`
`import Resource from 'ember-jsonapi-resources/models/resource'`
`import { attr, hasOne, hasMany } from 'ember-jsonapi-resources/models/resource'`

Score = Resource.extend
  type: 'scores'
  service: Ember.inject.service('scores')

  title: attr()
  description: attr()
  composer: attr()
  arranger: attr()
  duration: attr()
  genre: attr()
  publisher: attr()
  status: attr()

  parts: hasMany('score-parts')

`export default Score`
