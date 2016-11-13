`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`
`import PartActions from 'client/mixins/part-actions'`

AdminScoresListRoute = Ember.Route.extend FileManager, PartActions,
  actions:
    addFile: (file, part) ->
      @createFile(file).then (response) ->
        part.set('file', response.links.self)
        part.set('name', file.name)
    savePart: (score, part) ->
      part.set('score', score)
      part.set('modified', new Date())
      part.save()
    deleteScores: (scores) ->
      scores.forEach (score) ->
        score.destroyRecord()

`export default AdminScoresListRoute`
