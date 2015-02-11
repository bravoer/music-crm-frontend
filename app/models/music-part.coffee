`import DS from 'ember-data'`

MusicPart = DS.Model.extend
  # Attributes
  href: DS.attr 'string'
  type: DS.attr 'string'
  instrument: DS.attr 'string'
  instrumentPart: DS.attr 'string'
  key: DS.attr 'string'
  clef: DS.attr 'string'
  file: DS.attr 'string'
  created: DS.attr 'date'
  modified: DS.attr 'date'

  # Relationships
  musicScore: DS.belongsTo('musicScore')

`export default MusicPart`
