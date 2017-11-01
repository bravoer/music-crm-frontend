import Ember from 'ember'

export default Ember.Service.extend
  exportMusicians: (groupUuid) ->
    window.location = "/export/musicians?file=muzikanten.csv&group=#{groupUuid}"
  exportSympathizers: () ->
    window.location = '/export/sympathizers?file=sympathizanten.csv'
