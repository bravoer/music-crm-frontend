`import Ember from 'ember'`
`import ScoreActionsMixin from '../../../mixins/score-actions'`
`import { module, test } from 'qunit'`

module 'ScoreActionsMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  ScoreActionsObject = Ember.Object.extend ScoreActionsMixin
  subject = ScoreActionsObject.create()
  assert.ok subject
