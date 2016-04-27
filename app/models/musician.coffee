`import DS from 'ember-data'`

Musician = DS.Model.extend
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
  
`export default Musician`

