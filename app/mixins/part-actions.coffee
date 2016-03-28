`import Ember from 'ember'`

PartActionsMixin = Ember.Mixin.create
  actions:
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) ->
        part.destroyRecord()

`export default PartActionsMixin`
