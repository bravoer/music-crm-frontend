import Service from '../services/score-parts';
import Model from '../models/score-part';
import Adapter from '../adapters/score-part';
import Serializer from '../serializers/score-part';

export function initialize(container, application) {
  const adapter = 'service:score-parts-adapter';
  const serializer = 'service:score-parts-serializer';
  const service = 'service:score-parts';
  const model = 'model:score-parts';

  application.register(model, Model, { instantiate: false, singleton: false });
  application.register(service, Service);
  application.register(adapter, Adapter);
  application.register(serializer, Serializer);

  application.inject('service:store', 'score-parts', service);
  application.inject(service, 'serializer', serializer);
}

export default {
  name: 'score-parts-service',
  after: 'store',
  initialize: initialize
};
