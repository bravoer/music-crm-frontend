`import Ember from 'ember'`
`import PagePagination from 'client/mixins/page-pagination'`

ScoresIndexController = Ember.Controller.extend PagePagination,
  actions:
    download: (part) ->
      console.log 'Download file ' + part.get('file')
      window.location = part.get('file') + '/download'

`export default ScoresIndexController`
