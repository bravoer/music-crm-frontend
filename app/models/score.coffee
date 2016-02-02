`import DS from 'ember-data'`

Score = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  composer: DS.attr('string')
  arranger: DS.attr('string')
  duration: DS.attr('string')
  genre: DS.attr('string')
  publisher: DS.attr('string')
  status: DS.attr('string')

  parts: DS.hasMany('part')

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
