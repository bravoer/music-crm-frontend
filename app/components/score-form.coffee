import Ember from 'ember'
import GenreOptions from 'client/config/genre-options'

export default Ember.Component.extend
  genres: GenreOptions.get('genres')
