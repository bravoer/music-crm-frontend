import Ember from 'ember'

export default Ember.Controller.extend
  editMode: false
  paperToaster: Ember.inject.service()
  actions:
    cancel: () ->
      if @get('editMode')
        @get('model').rollbackAttributes()
        @get('model.address').then (address) -> address.rollbackAttributes()
        @get('model.telephones').then (telephones) ->
          telephones.forEach (telephone) -> telephone.rollbackAttributes()
        @set('editMode', false)
      else
        @transitionToRoute 'main.admin.musicians.index'
    save: () ->
      @get('model.address').then (address) =>
        promises = [address].filter((a) -> a.get('hasDirtyAttributes')).map (a) -> a.save()
        Ember.RSVP.Promise.all(promises).then () =>
          @get('model.telephones').then (telephones) =>
            promises = telephones.map (tel) ->
              if (tel.get('value') && tel.get('value').length > 0 && tel.get('hasDirtyAttributes'))
                tel.save()
              else if tel.get('hasDirtyAttributes')
                if tel.get('isNew') then tel.deleteRecord() else tel.destroyRecord()
            Ember.RSVP.Promise.all(promises).then () =>
              @get('model').save().then () =>
                @get('paperToaster').show("#{@get('model.name')} opgeslagen", { position: 'top right' })
                @set('editMode', false)
