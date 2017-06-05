import Ember from 'ember'

export default Ember.Controller.extend
  queryParams: ['page', 'size', 'sort']
  page: 0
  size: 50
  sort: 'title'
  session: Ember.inject.service('session')
  instrument: Ember.computed.alias('session.data.instrument')
