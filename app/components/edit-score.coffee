`import Ember from 'ember'`
`import BufferedProxy from 'ember-buffered-proxy/proxy'`
`import GenreOptions from 'client/config/genre-options'`

EditScoreComponent = Ember.Component.extend
  genres: GenreOptions.get('genres')

  actions:
    addPart: (file) ->
      @sendAction('addPart', file)
    deletePart: (part) ->
      @sendAction('deletePart', part)
      
`export default EditScoreComponent`
