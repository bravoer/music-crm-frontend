import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:main/admin/attendee-tracking/index', 'Unit | Route | main/admin/attendee tracking/index', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
