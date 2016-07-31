`import Ember from 'ember'`

ScoresIndexController = Ember.Controller.extend
  queryParams: ['page', 'size', 'sort']
  page: 0
  size: 20
  sort: 'title'
  session: Ember.inject.service('session')
  instrument: Ember.computed.alias('session.data.instrument')

`export default ScoresIndexController`
