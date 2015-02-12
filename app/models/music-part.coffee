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

MusicPart.reopenClass
  FIXTURES: [
      {
        "id": "1",
        "instrument": "cornet",
        "instrumentPart": "solo",
        "key": "Bb",
        "clef": "G-clef",
        "file": "http://metzlerbrass.com/resources/solo+cornet+catalog+image.jpg",
        "created": "2004-10-26T21:32:52+02:00",
        "musicScore": "1"
      },
      {
        "id": "2",
        "instrument": "cornet",
        "instrumentPart": "1st",
        "key": "Bb",
        "clef": "G-clef",
        "file": "http://www.trevorjonesltd.co.uk/images/YamahaXenoBbCornetYCR-8335.jpg",
        "musicScore": "1"
      },
      {
        "id": "3",
        "instrument": "cornet",
        "instrumentPart": "repiano",
        "key": "Bb",
        "clef": "G-clef",
        "file": "http://thumbs1.ebaystatic.com/d/l225/pict/221546042880_1.jpg",
        "musicScore": "1"
      },
      {
        "id": "4",
        "instrument": "euphonium",
        "instrumentPart": null,
        "key": "Bb",
        "clef": "F-clef",
        "file": "http://s434355904.initial-website.co.uk/s/cc_images/teaserbox_38723786.jpg?t=1416594732",
        "musicScore": "1"
      },
      {
        "id": "5",
        "instrument": "cornet",
        "instrumentPart": "repiano",
        "key": "Bb",
        "clef": "G-clef",
        "file": "http://thumbs1.ebaystatic.com/d/l225/pict/221546042880_1.jpg",
        "musicScore": "2"
      }
  ]

`export default MusicPart`
