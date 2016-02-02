`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

AdminScoresIndexRoute = Ember.Route.extend FileManager,
  model: ->
    @store.findAll 'score'
  actions:
    addFile: (file, part) ->
      @createFile(file).then (response) =>
        part.set('file', response.links.self)
        part.set('name', file.name)
    savePart: (score, part) ->
      part.set('score', score)
      part.save()       
    deleteScores: (scores) ->
      scores.forEach (score) ->
        score.destroyRecord()
    deletePart: (score, part) ->
      @deleteFile(part.get('file'))
      part.set('score', null)
      part.save().then (part) ->
        part.destroyRecord()

`export default AdminScoresIndexRoute`
