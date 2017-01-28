`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:main/admin/sympathizers/index', 'Unit | Route | main/admin/sympathizers/index', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
