import Ember from 'ember'
import moment from 'moment'

export default Ember.Controller.extend
  advancedSearch: Ember.inject.service()
  selectedTab: 0
  fromDate: moment(new Date()).subtract(1, 'years')
  fromDateStr: Ember.computed 'fromDate',
    get: ->
      if @get('fromDate')
        moment(@get('fromDate')).format('YYYY-MM-DD')
      else
        null
    set: (_key, value, prevValue) ->
      if value then @set('fromDate', new Date(value)) else @set('fromDate', null)
      value
  toDate: new Date()
  toDateStr: Ember.computed 'toDate',
    get: ->
      if @get('toDate')
        moment(@get('toDate')).format('YYYY-MM-DD')
      else
        null
    set: (_key, value, prevValue) ->
      if value then @set('toDate', new Date(value)) else @set('toDate', null)
      value
  attendancesPerRehearsal: Ember.computed 'advancedSearch', 'fromDate', 'toDate', 'selectedTab', ->
    @get('advancedSearch').attendancesPerRehearsal(@get('fromDate'), @get('toDate'))
  attendancesPerMusician: Ember.computed 'advancedSearch', 'fromDate', 'toDate', 'selectedTab', ->
    @get('advancedSearch').attendancesPerMusician(@get('fromDate'), @get('toDate'))
