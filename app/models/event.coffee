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

  attendees: DS.hasMany('musician', { inverse: 'attendances' } )
  legitimateAbsentees: DS.hasMany('musician', { inverse: 'legitimateAbsences' } )
  illegitimateAbsentees: DS.hasMany('musician', { inverse: 'illegitimateAbsences' } )

`export default Event`
