`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

PartActionsMixin = Ember.Mixin.create FileManager,
  actions:
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) ->
        part.destroyRecord()
    downloadPart: (part) ->
      @downloadFile part.get('file'), part.get('downloadFileName')

`export default PartActionsMixin`
