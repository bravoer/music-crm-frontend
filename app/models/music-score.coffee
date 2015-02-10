`import DS from 'ember-data'`

MusicScore = DS.Model.extend
  href: DS.attr 'string'
  title: DS.attr 'string'
  description: DS.attr 'string'
  componist: DS.attr 'string'
  arranger: DS.attr 'string'
  duration: DS.attr 'string'
  genre: DS.attr 'string'
  publisher: DS.attr 'string'
  status: DS.attr 'string'

`export default MusicScore`
