`import Ember from 'ember'`
`import PartActionsMixin from '../../../mixins/part-actions'`
`import { module, test } from 'qunit'`

module 'PartActionsMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  PartActionsObject = Ember.Object.extend PartActionsMixin
  subject = PartActionsObject.create()
  assert.ok subject
