`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Event = DS.Model.extend HasManyQuery.ModelMixin,
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
    parameters:
      page:
        size: 10000
  legitimateAbsentees: DS.hasMany 'musician',
    inverse: 'legitimateAbsences'
    parameters:
      page:
        size: 10000
  illegitimateAbsentees: DS.hasMany 'musician',
    inverse: 'illegitimateAbsences'
    parameters:
      page:
        size: 10000
  sponsorships: DS.hasMany 'sponsorship',
    parameters:
      page:
        size: 10000
  helpers: DS.hasMany 'sympathizer',
    parameters:
      page:
        size: 10000

`export default Event`
