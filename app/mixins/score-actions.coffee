`import Ember from 'ember'`

ScoreActionsMixin = Ember.Mixin.create
  actions:
    cancel: (score) ->
      score.rollbackAttributes()
      @transitionTo 'admin.scores.index'
    saveScore: (score) ->
      score.save().then () =>
        @transitionTo 'admin.scores.index'


`export default ScoreActionsMixin`
