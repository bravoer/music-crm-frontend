`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

AdminMusicScoresEditController = Ember.ObjectController.extend
  genres: GenreOptions.get('genres')
  rollback: (musicScore) ->
    musicScore.get('musicParts').then (musicParts) ->
      musicParts.filterBy('isDirty').forEach (part) -> part.rollback()
    musicScore.rollback()
  actions:
    cancel: ->
      @rollback(@get('model'))
      @transitionToRoute('admin.musicScores.index')
    save: ->
      musicScore = @get('model')
      musicScore.save().then (musicScore) =>
        musicScore.get('musicParts').then (musicParts) =>
          musicParts.save().then =>
            @transitionToRoute('admin.musicScores.index')
          , (error) ->
            @rollack(musicScore)
            toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
        , (error) ->
          console.log error
      , (error) ->
        @rollback(musicScore)
        toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
    addMusicPart: (musicPart) ->
      part = @store.createRecord('musicPart', musicPart)
      @store.find('musicScore', @get('model.id')).then (score) ->
        part.set 'musicScore', score
    deleteMusicPart: (musicPart) ->
      @store.find('musicPart', musicPart.get('id')).then (part) ->
        part.deleteRecord()

`export default AdminMusicScoresEditController`
