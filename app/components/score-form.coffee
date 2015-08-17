`import Ember from 'ember'`
`import GenreOptions from 'client/config/genre-options'`

ScoreFormComponent = Ember.Component.extend
  genres: GenreOptions.get('genres')

`export default ScoreFormComponent`
