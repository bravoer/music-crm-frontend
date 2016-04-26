`import Ember from 'ember'`

ScoreActionsMixin = Ember.Mixin.create
  actions:
    cancel: (score) ->
      score.rollbackAttributes()
      if score.get('status') == 'archived'
        @transitionTo 'main.admin.scores.list.archive'
      else
        @transitionTo 'main.admin.scores.list.active'
    saveScore: (score) ->
      score.set('modified', new Date())
      score.save().then () =>
        if score.get('status') == 'archived'
          @transitionTo 'main.admin.scores.list.archive'
        else
          @transitionTo 'main.admin.scores.list.active'

`export default ScoreActionsMixin`
