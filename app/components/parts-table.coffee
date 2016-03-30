`import Ember from 'ember'`

MusicPartsTableComponent = Ember.Component.extend
  sortedParts: Ember.computed.sort 'parts', (a,b) ->
      refArray = ['soprano', 'cornet', 'flugelhorn', 'althorn', 'bariton', 'euphonium', 'trombone', 'bass_bb', 'bass_eb', 'percussion', 'conductor']
      sort = refArray.indexOf(a.get('instrument')) - refArray.indexOf(b.get('instrument'))
      if sort == 0
        refArray = ['solo', '1st', '2nd', '3th', 'repiano', 'bas']
        sort = refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))
      return sort
        
  actions:
    delete: (part) ->
      @sendAction('delete', part)


`export default MusicPartsTableComponent`
