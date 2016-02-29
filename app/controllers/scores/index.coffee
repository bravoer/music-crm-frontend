`import Ember from 'ember'`

ScoresIndexController = Ember.Controller.extend
  actions:
    download: (part) ->
      console.log 'Download file ' + part.get('file')
      window.location = part.get('file') + '/download'

`export default ScoresIndexController`
