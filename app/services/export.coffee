`import Ember from 'ember'`

ExportService = Ember.Service.extend
  exportMusicians: (group) ->
    window.location = "/export/musicians?file=muzikanten.csv&group=#{group}"
  exportSympathizers: () ->
    window.location = '/export/sympathizers?file=sympathizanten.csv'

`export default ExportService`
