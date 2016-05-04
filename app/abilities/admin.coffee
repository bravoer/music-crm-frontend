`import { Ability } from 'ember-can'`

AdminAbility = Ability.extend
  session: Ember.inject.service()
  canManage: Ember.computed 'session.data.isBoard', 'session.data.isAdmin', ->
    data = @get('session.data')
    data.isBoard or data.isAdmin

`export default AdminAbility`
