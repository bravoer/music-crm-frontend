import Transform from 'ember-data/transform';

const eventTypeNs = 'http://mu.semte.ch/vocabularies/ext/bravoer/event-types/';

export default Transform.extend({
  deserialize(serialized) {
    switch(serialized) {
      case eventTypeNs + 'Rehearsal': return 'rehearsal';
      case eventTypeNs + 'Concert': return 'concert';
      case eventTypeNs + 'Other': return 'other';
      default: return serialized;
    }
  },
  serialize(deserialized) {
    switch(deserialized) {
      case 'rehearsal': return eventTypeNs + 'Rehearsal';
      case 'concert': return eventTypeNs + 'Concert';
      case 'other': return eventTypeNs + 'Other';
      default: return deserialized;
    }
  }
});
