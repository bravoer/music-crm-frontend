`import Ember from 'ember'`
`import FileManagerMixin from '../../../mixins/file-manager'`

module 'FileManagerMixin'

# Replace this with your real tests.
test 'it works', ->
  FileManagerObject = Ember.Object.extend FileManagerMixin
  subject = FileManagerObject.create()
  ok subject
