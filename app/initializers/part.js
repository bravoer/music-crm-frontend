import Service from '../services/parts';
import Model from '../models/part';
import Adapter from '../adapters/part';
import Serializer from '../serializers/part';

export function initialize(container, application) {
  const adapter = 'service:parts-adapter';
  const serializer = 'service:parts-serializer';
  const service = 'service:parts';
  const model = 'model:parts';

  application.register(model, Model, { instantiate: false, singleton: false });
  application.register(service, Service);
  application.register(adapter, Adapter);
  application.register(serializer, Serializer);

  application.inject('service:store', 'parts', service);
  application.inject(service, 'serializer', serializer);
}

export default {
  name: 'parts-service',
  after: 'store',
  initialize: initialize
};
