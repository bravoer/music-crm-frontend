import Service from '../services/sessions';
import Model from '../models/session';
import Adapter from '../adapters/session';
import Serializer from '../serializers/session';

export function initialize(container, application) {
  const adapter = 'service:sessions-adapter';
  const serializer = 'service:sessions-serializer';
  const service = 'service:sessions';
  const model = 'model:sessions';

  application.register(model, Model, { instantiate: false, singleton: false });
  application.register(service, Service);
  application.register(adapter, Adapter);
  application.register(serializer, Serializer);

  application.inject('service:store', 'sessions', service);
  application.inject(service, 'serializer', serializer);
}

export default {
  name: 'sessions-service',
  after: 'store',
  initialize: initialize
};
