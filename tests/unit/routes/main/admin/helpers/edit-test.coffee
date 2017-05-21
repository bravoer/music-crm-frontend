`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:main/admin/helpers/edit', 'Unit | Route | main/admin/helpers/edit', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
