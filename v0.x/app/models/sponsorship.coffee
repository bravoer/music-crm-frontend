import DS from 'ember-data'

export default DS.Model.extend
  amount: DS.attr('double')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  event: DS.belongsTo 'event'
  sponsor: DS.belongsTo 'sympathizer'
