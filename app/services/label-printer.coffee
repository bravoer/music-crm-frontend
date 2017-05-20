`import Ember from 'ember'`

LabelPrinterService = Ember.Service.extend
  invitationLabels: () ->
    window.location = '/label-printer/invitations'

`export default LabelPrinterService`
