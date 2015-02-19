`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

AdminMusicScoresEditController = Ember.ObjectController.extend
  genres: GenreOptions.get('genres')

  addedParts: []
  deletedParts: []
  
  rollback: (score) ->
    # Rollback the score and new/edited parts
    score = @get('model')
    score.get('musicParts').then (parts) ->
      parts.forEach (part) -> part.rollback() if part
    score.rollback()

    # Delete uploaded files of new parts
    @get('addedParts').forEach (part) =>
      @get('deletedParts').removeObject part # parts that have been added and removed in the same cycle should not be restored
      url = part.get('file')
      id = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."))
      Ember.$.ajax
        url: "/bravoer/documents/#{id}"
        type: "DELETE"

    # Restore deleted parts
    @get('deletedParts').forEach (part) -> part.rollback()
    @set 'deletedParts', []
    @set 'addedParts', []

    
  actions:
    cancel: ->
      boundRollback = Ember.run.bind(@, @rollback)
      boundRollback()
      @transitionToRoute 'admin.musicScores.index'
    save: ->
      boundRollback = Ember.run.bind(@, @rollback)
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
            boundRollback()
            toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
      , (error) ->
        boundRollback()
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
