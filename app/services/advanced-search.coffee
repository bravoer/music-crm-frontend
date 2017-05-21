`import Ember from 'ember'`

AdvancedSearchService = Ember.Service.extend
  store: Ember.inject.service('store')
  helpers: () ->
    since = new Date()
    since.setFullYear(since.getFullYear() - 1)
    url = "/advanced-search/helpers?since=#{since.toISOString().substring(0, 10)}"
    Ember.$.get(url).then (result) =>
      console.log('Result is: ' + JSON.stringify(result))
      uuids = result.data.uuids
      @get('store').query 'sympathizer',
        filter:
          id: uuids.join(',')
        size: 10000
        sort: 'last-name'

`export default AdvancedSearchService`
