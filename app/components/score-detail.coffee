import Ember from 'ember'

export default Ember.Component.extend
  paperToaster: Ember.inject.service()
  file: Ember.inject.service()
  selectedScore: null
  isDeleting: false
  actions:
    delete: (score) ->
      @set('isDeleting', true)
      title = score.get('title')
      score.get('parts').then (parts) =>
        copiedParts = parts.slice(0)
        copiedParts.forEach (part) =>
          @get('file').deleteFile(part)
          part.set('score', null)
          part.set('modified', new Date())
        partSavePromises = copiedParts.map (part) -> part.save()
        Ember.RSVP.Promise.all(partSavePromises).finally () => # don't care wether save was successful
          partDeletePromises = copiedParts.map (part) -> part.destroyRecord()
          Ember.RSVP.Promise.all(partDeletePromises).then () =>
            score.destroyRecord().then () =>
              @get('paperToaster').show("#{title} verwijderd", { position: 'top right' })
              @set('selectedScore', null)
              @set('isDeleting', false)
              @get('cancel')()
