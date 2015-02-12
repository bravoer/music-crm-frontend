`import DS from 'ember-data'`

MusicScore = DS.Model.extend
  # Attributes
  href: DS.attr 'string'
  type: DS.attr 'string'
  title: DS.attr 'string'
  description: DS.attr 'string'
  composer: DS.attr 'string'
  arranger: DS.attr 'string'
  duration: DS.attr 'string'
  genre: DS.attr 'string'
  publisher: DS.attr 'string'
  status: DS.attr 'string'
  created: DS.attr 'date'
  modified: DS.attr 'date'

  # Relationships
  musicParts: DS.hasMany('musicPart', {async: true})

  # Properties
  isActive: Ember.computed 'status', ->
    @get('status') == 'active'
  isArchived: Ember.computed 'status', ->
    @get('status') == 'archived'

MusicScore.reopenClass
  FIXTURES: [
    {
      "id": "1",
      "href": "http://data.bravoer.be/musicScores/1",
      "title": "Ad Optimum",
      "description": "Peter Graham's Ad Optimum – To the Highest, written for the Star Lake Music Camp in 1999, is the composer's response to the memory of witnessing James Williams conducting Eric Leidzen's None Other Name at Star Lake in 1985. A setting of three hymn tunes, Laudes Domini, The Name of Jesus and Richmond, it provides a rousing finale to an interesting piece that is characteristic of this composer's style.",
      "composer": "Peter Graham",
      "arranger": "Luc Vertommen",
      "duration": "125000",
      "genre": "classic",
      "publisher": "Band Press",
      "status": "active",
      "created": "2001-10-26T21:32:52+02:00",
      "modified": "2015-02-12T07:32:52+02:00",
      "musicParts": ["1", "2", "3", "4"]
    },
    {
      "id": "2",
      "href": "http://data.bravoer.be/musicScores/2",
      "title": "Malaguena",
      "description": "A 'Malaguena' is a woman living in the Spanish port city of Malaga, on the southern coast of Spain, in the province of Andalucia. Lecuona's Malaguena was originally the sixth movement of his 'Suite Andalucia' and has been performed in many versions by artists such as Connie Francis, Stan Kenton's Orchestra and Bill Haley and the Comets as well as featuring as part of the Broadway musical entitled 'Blast!'. ",
      "composer": "Ernesto Lecuona",
      "arranger": null,
      "duration": null,
      "genre": null,
      "publisher": "IMP",
      "status": "active",
      "musicParts": ["5"]
    }
  ]


`export default MusicScore`
