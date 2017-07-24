import Ember from 'ember'
import DS from 'ember-data'

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
_musicianGroups = null

export default Ember.Service.extend
  ajax: Ember.inject.service()
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
  musicianGroups: () ->
    if _musicianGroups
      DS.PromiseObject.create
        promise: Ember.RSVP.resolve(_musicianGroups)
    else
      DS.PromiseObject.create
        promise: @get('ajax').request('/musician-groups').then (response) ->
          _musicianGroups = response.data.map (item) ->
            { id: item.id, label: item.attributes.name }
          _musicianGroups
