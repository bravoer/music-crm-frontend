import Service from '../services/scores';
import Model from '../models/score';
import Adapter from '../adapters/score';
import Serializer from '../serializers/score';

export function initialize(container, application) {
  const adapter = 'service:scores-adapter';
  const serializer = 'service:scores-serializer';
  const service = 'service:scores';
  const model = 'model:scores';

  application.register(model, Model, { instantiate: false, singleton: false });
  application.register(service, Service);
  application.register(adapter, Adapter);
  application.register(serializer, Serializer);

  application.inject('service:store', 'scores', service);
  application.inject(service, 'serializer', serializer);
}

export default {
  name: 'scores-service',
  after: 'store',
  initialize: initialize
};
