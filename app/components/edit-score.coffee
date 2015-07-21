`import Ember from 'ember'`
`import BufferedProxy from 'ember-buffered-proxy/proxy'`
`import GenreOptions from 'client/config/genre-options'`

EditScoreComponent = Ember.Component.extend
  genres: GenreOptions.get('genres')

  scoreBuffer: Ember.computed 'score', -> 
    BufferedProxy.create { content: @get('score') }

  actions:
    save: ->
      @get('scoreBuffer').applyChanges()
      @sendAction('save')
    cancel: ->
      @get('scoreBuffer').discardChanges()
      @sendAction('cancel')
      
`export default EditScoreComponent`
