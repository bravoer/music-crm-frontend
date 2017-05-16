`import Ember from 'ember'`

ExportService = Ember.Service.extend
  exportMusicians: (group) ->
    window.location = "/export/musicians?file=muzikanten.csv&group=#{group}"

`export default ExportService`
