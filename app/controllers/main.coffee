import Ember from 'ember'

export default Ember.Controller.extend
  session: Ember.inject.service()
  actions:
    openMail: () ->
      window.location.href = 'mailto:backstage@bravoer.be'
    goToGuidelines: () ->
      window.location.href = 'http://bravoer.be/backstage/huishoudelijk_reglement.pdf'
