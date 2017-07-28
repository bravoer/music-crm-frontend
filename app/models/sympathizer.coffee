import DS from 'ember-data'

export default DS.Model.extend
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

  name: Ember.computed 'prefix', 'firstName', 'lastName', 'organizationName', ->
    if @get('organizationName')
      @get('organizationName')
    else
      "#{@get('prefix') || ''} #{@get('firstName') || ''} #{@get('lastName') || ''}".trim()
