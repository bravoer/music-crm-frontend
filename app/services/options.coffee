import Ember from 'ember'
import DS from 'ember-data'

_prefixes = ['Mr.', 'Mevr.', 'Fam.']
_genres = ['klassiek', 'licht']
_instruments = ['soprano', 'cornet', 'flugel', 'alto', 'bariton', 'trombone', 'euphonium', 'bas Eb', 'bas Bb', 'slagwerk', 'dirigent']
_instrumentParts = ['solo', '1e', '2e', '3e', 'repiano', 'bas']
_eventTypes = ['repetitie', 'concert', 'andere']
_partsPerInstrument =
  'soprano': []
  'cornet': ['solo', 'repiano', '2e', '3e']
  'flugel': []
  'alto': ['solo', '1e', '2e']
  'bariton': ['1e', '2e']
  'trombone': ['1e', '2e', 'bas']
  'euphonium': []
  'bas Eb': []
  'bas Bb': []
  'slagwerk': []
  'dirigent': []
musicianGroups = null

export default Ember.Service.extend
  store: Ember.inject.service()
  prefixes: () -> _prefixes
  genres: () -> _genres
  instruments: () -> _instruments
  instrumentParts: () -> _instrumentParts
  sortInstrumentParts: (parts) ->
    sortedParts = parts.slice(0) # make a copy of the array
    sortedParts.sort (a, b) ->
      sort = _instruments.indexOf(a.get('instrument')) - _instruments.indexOf(b.get('instrument'))
      if sort == 0
        sort = _instrumentParts.indexOf(a.get('instrumentPart')) - _instrumentParts.indexOf(b.get('instrumentPart'))
      return sort
    sortedParts
  partsPerInstrument: () -> _partsPerInstrument
  eventTypes: () -> _eventTypes
  musicianGroupsLoaded: false
  musicianGroups: () ->
    if @get('musicianGroupsLoaded')
      @get('store').peekAll('musician-group')
    else
      @set('musicianGroupsLoaded', true)
      @get('store').findAll('musician-group')
