`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:main/admin/helpers/index', 'Unit | Route | main/admin/helpers/index', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
