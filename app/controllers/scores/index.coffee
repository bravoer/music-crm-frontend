`import Ember from 'ember'`

ScoresIndexController = Ember.Controller.extend
  queryParams: ['page', 'size', 'sort']
  page: 0
  size: 20
  sort: 'title'
  actions:
    download: (part) ->
      window.location = part.get('file') + '/download'

`export default ScoresIndexController`
