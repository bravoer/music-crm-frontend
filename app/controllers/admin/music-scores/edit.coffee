`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

AdminMusicScoresEditController = Ember.ObjectController.extend
  genres: GenreOptions.get('genres')

  addedParts: []
  deletedParts: []
  
  rollback: (score, addedParts, deletedParts) ->
    partsToRestore = deletedParts
    score.get('musicParts').then (musicParts) ->
      musicParts.forEach (part) -> part.rollback()
    score.rollback()
    addedParts.forEach (part) ->
      partsToRestore.removeObject part # newly added parts should not be restored
      url = part.get('file')
      id = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."))
      Ember.$.ajax
        url: "/bravoer/documents/#{id}"
        type: "DELETE"
    partsToRestore.forEach (part) -> part.rollback()
    
  actions:
    cancel: ->
      @rollback(@get('model'), @get('addedParts'), @get('deletedParts'))
      @set 'deletedParts', []
      @set 'addedParts', []
      @transitionToRoute 'admin.musicScores.index'
    save: ->
      @get('model').save().then (score) =>
        score.get('musicParts').then (musicParts) =>
          musicParts.save().then =>
            @get('deletedParts').forEach (part) ->
              url = part.get('file')
              id = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."))
              Ember.$.ajax
                url: "/bravoer/documents/#{id}"
                type: "DELETE"
            @set 'deletedParts', []
            @set 'addedParts', []
            @transitionToRoute 'admin.musicScores.index'
          , (error) ->
            @rollback(score, @get('addedParts'), @get('deletedParts'))
            @set 'deletedParts', []
            @set 'addedParts', []
            toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
      , (error) ->
        @rollback(@get('model'), @get('addedParts'), @get('deletedParts'))
        @set 'deletedParts', []
        @set 'addedParts', []
        toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
    addMusicPart: (musicPart) ->
      if musicPart.file
        part = @store.createRecord('musicPart', musicPart)
        part.set 'musicScore', @get('model')
        @get('addedParts').pushObject(part)
      else
        toast('Partituur opladen is mislukt', 5000, 'warn')
    deleteMusicPart: (musicPart) ->
      @store.find('musicPart', musicPart.get('id')).then (part) =>
        @get('deletedParts').pushObject(part)
        part.deleteRecord()

`export default AdminMusicScoresEditController`
