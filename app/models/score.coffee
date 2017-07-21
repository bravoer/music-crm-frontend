import DS from 'ember-data'

export default DS.Model.extend {
  title: DS.attr('string')
  comment: DS.attr('string')
  composer: DS.attr('string')
  arranger: DS.attr('string')
  duration: DS.attr('string')
  genre: DS.attr('string')
  publisher: DS.attr('string')
  status: DS.attr('string')
  location: DS.attr('string')
  isOriginal: DS.attr('boolean')
  loan: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

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
}
