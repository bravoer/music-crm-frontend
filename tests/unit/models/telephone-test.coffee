import { moduleForModel, test } from 'ember-qunit'

moduleForModel 'telephone', 'Unit | Model | telephone', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
