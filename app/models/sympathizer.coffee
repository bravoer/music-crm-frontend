`import DS from 'ember-data'`

Sympathizer = DS.Model.extend
  prefix: DS.attr('string')
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  organizationName: DS.attr('string')
  email: DS.attr('email')
  communication: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  address: DS.belongsTo('address')
  telephones: DS.hasMany('telephone')

  voluntaryActivities: DS.hasMany 'event',
    parameters:
      page:
        size: 10000
  sponsorships: DS.hasMany 'sponsorship',
    parameters:
      page:
        size: 10000

  name: Ember.computed 'firstName', 'lastName', 'organizationName', ->
    if @get('organizationName')
      @get('organizationName')
    else
      @get('firstName') + ' ' + @get('lastName')

`export default Sympathizer`
