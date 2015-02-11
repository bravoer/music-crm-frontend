`import DS from 'ember-data'`

MusicScore = DS.Model.extend
  # Attributes
  href: DS.attr 'string'
  type: DS.attr 'string'
  title: DS.attr 'string'
  description: DS.attr 'string'
  componist: DS.attr 'string'
  arranger: DS.attr 'string'
  duration: DS.attr 'string'
  genre: DS.attr 'string'
  publisher: DS.attr 'string'
  publicationDate: DS.attr 'date'
  status: DS.attr 'string'

  # Relationships
  musicParts: DS.hasMany('musicPart', {async: true})

`export default MusicScore`
