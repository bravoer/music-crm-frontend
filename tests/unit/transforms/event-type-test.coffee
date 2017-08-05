import { moduleFor, test } from 'ember-qunit'

moduleFor 'transform:event-type', 'Unit | Transform | event type', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  transform = @subject()
  assert.ok transform
