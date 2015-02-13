`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

AdminMusicScoresEditController = Ember.ObjectController.extend
  genres: GenreOptions.get('genres')
  actions:
    save: ->
      musicScore = @get('model')
      musicScore.save().then =>
        @transitionToRoute('admin.musicScores.index')
      , (error) =>
        console.log musicScore
        console.log error
        musicScore.rollback()
        toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')
    saveMusicPart: (musicPart) ->
      part = @store.createRecord('musicPart', musicPart) 
      @store.find('musicScore', @get('model.id')).then (score) =>
        part.set 'musicScore', score
        part.save().then ->
          toast('Success!', 5000)
        , ->  
          toast('Oeps... er is iets foutgelopen bij het opslaan!', 5000, 'warn')


`export default AdminMusicScoresEditController`
