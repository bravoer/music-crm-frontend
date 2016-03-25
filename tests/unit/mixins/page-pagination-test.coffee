`import Ember from 'ember'`
`import PagePaginationMixin from '../../../mixins/page-pagination'`
`import { module, test } from 'qunit'`

module 'PagePaginationMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  PagePaginationObject = Ember.Object.extend PagePaginationMixin
  subject = PagePaginationObject.create()
  assert.ok subject
