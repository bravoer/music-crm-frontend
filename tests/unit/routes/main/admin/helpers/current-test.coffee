import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:main/admin/helpers/current', 'Unit | Route | main/admin/helpers/current', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
