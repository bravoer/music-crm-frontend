`import Ember from 'ember'`
`import FileManager from 'client/mixins/file-manager'`

MusicScoreTableComponent = Ember.Component.extend FileManager,
  didInsertElement: ->
    $('.modal-trigger').leanModal()

  musicScoreModalId: Ember.computed 'elementId', ->
    "##{@get('elementId')} .music-score-modal"

  actions:
    selectScore: (score) ->
      @set 'selectedScore', score
    toggleStatus: (score) ->
      if score.get('isActive')
        score.set('status', 'archived')
      else
        score.set('status', 'active')
      score.save()
    delete: (score) ->
      score.get('musicParts').then (parts) =>
        Ember.RSVP.Promise.all( parts.map (part) =>
          if part
            @deleteDocument(part.get('file'))
            part.destroyRecord()
        ).then ->
          score.destroyRecord()
          
`export default MusicScoreTableComponent`
