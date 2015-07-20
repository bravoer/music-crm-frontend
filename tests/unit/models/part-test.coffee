`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'part', {
  # Specify the other units that are required for this test.

}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
