`import DS from 'ember-data'`

MusicianGroup = DS.Model.extend
  name: DS.attr('string')
  created: DS.attr('date',
    defaultValue: () -> new Date()
  )
  modified: DS.attr('date',
    defaultValue: () -> new Date()
  )

  musicians: DS.hasMany 'musician'

`export default MusicianGroup`
