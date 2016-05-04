`import { Ability } from 'ember-can'`

ScoreAbility = Ability.extend
  session: Ember.inject.service()
  canRead: Ember.computed 'session.data.isMusician', 'session.data.isBoard', 'session.data.isAdmin', ->
    data = @get('session.data')
    data.isMusician or data.isBoard or data.isAdmin

`export default ScoreAbility`
