import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:main/admin/musicians/add', 'Unit | Route | main/admin/musicians/add', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
