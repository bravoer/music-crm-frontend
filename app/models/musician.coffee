`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Musician = DS.Model.extend HasManyQuery.ModelMixin,
  prefix: DS.attr('string')
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  instrument: DS.attr('string')
  email: DS.attr('email')
  birthdate: DS.attr('date')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  address: DS.belongsTo('address')
  telephones: DS.hasMany('telephone')

  user: DS.belongsTo('user')

  groups: DS.hasMany 'musicianGroup'
  attendances: DS.hasMany 'event',
    parameters:
      page:
        size: 10000
  legitimateAbsences: DS.hasMany 'event',
    parameters:
      page:
        size: 10000
  illegitimateAbsences: DS.hasMany 'event',
    parameters:
      page:
        size: 10000

  name: Ember.computed 'firstName', 'lastName', ->
    @get('firstName') + ' ' + @get('lastName')

`export default Musician`
