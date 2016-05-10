`import Ember from 'ember'`

ScoresIndexController = Ember.Controller.extend
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
          score.set('filteredParts', filteredParts)
        score
  actions:
    download: (part) ->
      window.location = part.get('file') + '/download'

`export default ScoresIndexController`
