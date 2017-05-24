import Ember from 'ember'

export default Ember.Service.extend
  invitationLabels: () ->
    window.location = '/label-printer/invitations'
