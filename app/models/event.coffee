import DS from 'ember-data'

export default DS.Model.extend
  name: DS.attr('string')
  type: DS.attr('eventType')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  attendees: DS.hasMany 'musician',
    inverse: 'attendances'

  absentees: DS.hasMany 'musician',
    inverse: 'absences'

  helpers: DS.hasMany 'sympathizer'

  startDateStr: Ember.computed 'startDate',
    get: ->
      if @get('startDate')
        moment(@get('startDate')).format('YYYY-MM-DD')
      else
        null
    set: (_key, value, prevValue) ->
      if value then @set('startDate', new Date(value)) else @set('startDate', null)
      value
