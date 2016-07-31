`import { Ability } from 'ember-can'`

SystemAbility = Ability.extend
  session: Ember.inject.service()
  canManage: Ember.computed 'session.data.isAdmin', ->
    data = @get('session.data')
    data.isAdmin

`export default SystemAbility`