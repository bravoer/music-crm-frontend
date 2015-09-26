`import Ember from 'ember'`
`import Resource from 'ember-jsonapi-resources/models/resource'`
`import { attr, hasOne, hasMany } from 'ember-jsonapi-resources/models/resource'`

Session = Resource.extend
  type: 'sessions'
  service: Ember.inject.service('sessions')

  nickname: attr()
  password: attr()
  
`export default Session`
