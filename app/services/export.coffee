import Ember from 'ember'

export default Ember.Service.extend
  exportMusicians: (group) ->
    window.location = "/export/musicians?file=muzikanten.csv&group=#{group}"
  exportSympathizers: () ->
    window.location = '/export/sympathizers?file=sympathizanten.csv'
