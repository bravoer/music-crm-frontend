import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:main/admin/scores/edit', 'Unit | Route | main/admin/scores/edit', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
