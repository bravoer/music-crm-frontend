import Ember from 'ember'
import DS from 'ember-data'

_prefixes = ['Mr.', 'Mevr.', 'Fam.']
_genres = ['classic', 'light']
_instruments = ['soprano', 'cornet', 'flugelhorn', 'althorn', 'bariton', 'trombone', 'euphonium', 'bass_eb', 'bass_bb', 'percussion', 'conductor']
_instrumentParts = ['solo', '1st', '2nd', '3th', 'repiano', 'bas']
_partsPerInstrument =
  'soprano': []
  'cornet': ['solo', 'repiano', '2nd', '3th']
  'flugelhorn': []
  'althorn': ['solo', '1st', '2nd']
  'bariton': ['1st', '2nd']
  'trombone': ['1st', '2nd', 'bas']
  'euphonium': ['solo', '2nd']
  'bass_eb': []
  'bass_bb': []
  'percussion': []
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
  musicianGroupsLoaded: false
  musicianGroups: () ->
    if @get('musicianGroupsLoaded')
      @get('store').peekAll('musician-group')
    else
      @set('musicianGroupsLoaded', true)
      @get('store').findAll('musician-group')
