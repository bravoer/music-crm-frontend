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

  isActive: Ember.computed 'status', (key, value, prevValue) ->
    if arguments.length > 1
      if value and value != prevValue then @set('status', 'active') else @set('status', 'archived')
    @get('status') == 'active'
  isArchived: Ember.computed 'status', (key, value, prevValue) ->
    if arguments.length > 1
      if value and value != prevValue then @set('status', 'active') else @set('status', 'archived')
    @get('status') == 'archived'

`export default Score`
