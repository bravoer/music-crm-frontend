`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

EditScoreComponent = Ember.Component.extend
  genres: GenreOptions.get('genres')

  actions:
    save: ->
      @sendAction('save')
    cancel: ->
      @sendAction('cancel')
      
`export default EditScoreComponent`
