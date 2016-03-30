`import Ember from 'ember'`
`import FieldSortingMixin from '../../../mixins/field-sorting'`
`import { module, test } from 'qunit'`

module 'FieldSortingMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  FieldSortingObject = Ember.Object.extend FieldSortingMixin
  subject = FieldSortingObject.create()
  assert.ok subject
