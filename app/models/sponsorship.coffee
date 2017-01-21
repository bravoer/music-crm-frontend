`import DS from 'ember-data'`

Sponsorship = DS.Model.extend
  amount: DS.attr('double')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  event: DS.belongsTo 'event'
  sponsor: DS.belongsTo 'sympathizer'

`export default Sponsorship`
