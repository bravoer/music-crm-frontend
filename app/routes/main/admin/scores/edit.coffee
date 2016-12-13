`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresEditRoute = Ember.Route.extend FileManager,
  model: (params) ->
    @store.findRecord 'score', params.id
  actions:
    cancel: () ->
      score = @modelFor('main.admin.scores.edit')
      status = score.get('status')
      score.rollbackAttributes()
      @transitionTo 'main.admin.scores.index', status
    save: () ->
      score = @modelFor('main.admin.scores.edit')
      score.set('modified', new Date())
      score.save().then (score) =>
        @transitionTo 'main.admin.scores.index', score.get('status')
    deletePart: (part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.set('modified', new Date())
      part.save().then (part) ->
        part.destroyRecord()
    downloadPart: (part) ->
      @downloadFile part.get('file'), part.get('downloadFileName')

`export default AdminScoresEditRoute`
