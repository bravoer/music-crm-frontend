`import Ember from 'ember'`

ScoresTableComponent = Ember.Component.extend
  actions:
    delete: (score) ->
      @sendAction('delete', score)
    openDetail: (score) ->
      @set('selectedScore', score)
      @set('detailIsOpen', true)


`export default ScoresTableComponent`
