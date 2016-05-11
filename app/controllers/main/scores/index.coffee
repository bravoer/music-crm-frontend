`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`
`import InstrumentPartOptions from 'client/config/instrument-part-options'`

ScoresIndexController = Ember.Controller.extend FileManager,
  queryParams: ['page', 'size', 'sort']
  page: 0
  size: 20
  sort: 'title'
  session: Ember.inject.service('session')
  scoreFilteredParts: Ember.computed 'model.@each.parts', ->
      instrument = @get('session.data.instrument')
      @get('model').map (score) =>
        score.get('parts').then (parts) =>
          filteredParts = parts.filterBy('instrument', instrument)
          refArray = InstrumentPartOptions.get('options')
          filteredParts.sort (a,b) =>
            refArray.indexOf(a.get('instrumentPart')) - refArray.indexOf(b.get('instrumentPart'))
          score.set('filteredParts', filteredParts)
        score
  actions:
    download: (part) ->
      @downloadFile part.get('file'), part.get('downloadFileName')

`export default ScoresIndexController`
