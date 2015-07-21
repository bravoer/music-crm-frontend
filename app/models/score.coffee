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

  parts: hasMany('parts')

  _hasStatus: (status) ->
    @get('status') == status
  isActive: Ember.computed 'status',
    get: ->
      @_hasStatus('active')
    set: (_key, value, prevValue) ->
      if value and value != prevValue then @set('status', 'active') else @set('status', 'archived')
      @_hasStatus('active')
  isArchived: Ember.computed 'status',
    get: ->
      @_hasStatus('archived')
    set: (_key, value, prevValue) ->
      if value and value != prevValue then @set('status', 'archived') else @set('status', 'active')
      @_hasStatus('archived')
      
`export default Score`
