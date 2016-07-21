`import DS from 'ember-data'`

Event = DS.Model.extend
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

  attendees: DS.hasMany('musician')
  legitimateAbsentees: DS.hasMany('musician')
  illegitimateAbsentees: DS.hasMany('musician')

`export default Event`
