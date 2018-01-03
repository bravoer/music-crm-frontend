import Ember from 'ember'

export default Ember.Service.extend
  printInvitations: () ->
    window.location = '/label-printer/invitations'
