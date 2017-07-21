import DS from 'ember-data'

export default DS.Model.extend {
  name: DS.attr('string')
  instrument: DS.attr('string')
  instrumentPart: DS.attr('string')
  file: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  score: DS.belongsTo('score')
}
