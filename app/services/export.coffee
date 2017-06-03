import Ember from 'ember'

export default Ember.Service.extend
  exportMusicians: (group) ->
    groupUri = "http://data.bravoer.be/id/musician-groups/#{group}"
    window.location = "/export/musicians?file=muzikanten.csv&group=#{groupUri}"
  exportSympathizers: () ->
    window.location = '/export/sympathizers?file=sympathizanten.csv'
