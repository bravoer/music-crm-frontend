import DS from 'ember-data';
import HasManyQuery from 'ember-data-has-many-query';

export default DS.JSONAPIAdapter.extend(HasManyQuery.RESTAdapterMixin, {
  
});
