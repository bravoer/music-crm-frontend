import Ember from 'ember'

export default Ember.Controller.extend
  paperToaster: Ember.inject.service()
  actions:
    cancel: () ->
      @get('model').deleteRecord()
      @transitionToRoute 'main.admin.musicians.index'
    save: () ->
      @get('model.address').then (address) =>
        address.save().then () =>
          @get('model.telephones').then (telephones) =>
            promises = telephones.map (tel) ->
              if (tel.get('value') && tel.get('value').length > 0) then tel.save() else tel.deleteRecord()
            Ember.RSVP.Promise.all(promises).then () =>
              @get('model').save().then (musician) =>
                @get('paperToaster').show("#{@get('model.name')} aangemaakt", { position: 'top right' })
                @transitionToRoute 'main.admin.musicians.edit', musician
