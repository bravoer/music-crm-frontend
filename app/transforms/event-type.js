import Transform from 'ember-data/transform';

const eventTypeNs = 'http://mu.semte.ch/vocabularies/ext/bravoer/event-types/';

export default Transform.extend({
  deserialize(serialized) {
    switch(serialized) {
      case eventTypeNs + 'Rehearsal': return 'repetitie';
      case eventTypeNs + 'Concert': return 'concert';
      case eventTypeNs + 'Other': return 'andere';
      default: return serialized;
    }
  },
  serialize(deserialized) {
    switch(deserialized) {
      case 'repetitie': return eventTypeNs + 'Rehearsal';
      case 'concert': return eventTypeNs + 'Concert';
      case 'andere': return eventTypeNs + 'Other';
      default: return deserialized;
    }
  }
});
