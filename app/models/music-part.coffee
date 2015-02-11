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

  # Relationships
  musicScore: DS.belongsTo('musicScore')

`export default MusicPart`
