import Ember from 'ember'

export default Ember.Service.extend
  ajax: Ember.inject.service()
  store: Ember.inject.service()
  helpers: (since = new Date()) ->
    since.setFullYear(since.getFullYear() - 1)
    url = "/advanced-search/helpers?since=#{since.toISOString().substring(0, 10)}"
    @get('ajax').request(url).then (result) =>
      uuids = result.data.uuids
      @get('store').query 'sympathizer',
        filter:
          id: uuids.join(',')
        size: result.data.uuids.length
        sort: 'last-name'
