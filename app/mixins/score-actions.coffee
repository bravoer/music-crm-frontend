`import Ember from 'ember'`

ScoreActionsMixin = Ember.Mixin.create
  actions:
    cancel: (score) ->
      score.rollbackAttributes()
      if score.get('status') == 'archived'
        @transitionTo 'admin.scores.list.archive'
      else
        @transitionTo 'admin.scores.list.active'
    saveScore: (score) ->
      score.save().then () =>
        if score.get('status') == 'archived'
          @transitionTo 'admin.scores.list.archive'
        else
          @transitionTo 'admin.scores.list.active'

`export default ScoreActionsMixin`
