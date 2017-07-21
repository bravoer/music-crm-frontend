import Ember from 'ember'

export default Ember.Service.extend
  genres: () ->
    return ['classic', 'light']
