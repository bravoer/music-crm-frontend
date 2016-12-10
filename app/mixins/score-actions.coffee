`import Ember from 'ember'`

ScoreActionsMixin = Ember.Mixin.create
  actions:
    cancel: (score) ->
      score.rollbackAttributes()
      if score.get('status') == 'archived'
        @transitionTo 'main.admin.scores.index', 'archive'
      else
        @transitionTo 'main.admin.scores.index', 'active'
    saveScore: (score) ->
      score.set('modified', new Date())
      score.save().then () =>
        if score.get('status') == 'archived'
          @transitionTo 'main.admin.scores.index', 'archive'
        else
          @transitionTo 'main.admin.scores.index', 'active'

`export default ScoreActionsMixin`
