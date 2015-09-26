import Adapter from '../adapters/session';
import ServiceCache from '../mixins/service-cache';

Adapter.reopenClass({ isServiceFactory: true });

export default Adapter.extend(ServiceCache);
