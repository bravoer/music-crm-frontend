import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:main/admin/scores/index', 'Unit | Route | main/admin/scores/index', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
