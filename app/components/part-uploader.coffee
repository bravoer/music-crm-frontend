import Ember from 'ember'

export default Ember.Component.extend
  store: Ember.inject.service()
  paperToaster: Ember.inject.service()
  fileQueue: Ember.inject.service()
  classNames: ['part-upload']
  isUploaded: Ember.computed 'uploadedParts.[]', 'instrument', 'part', ->
    !@get('isSpecial') && @get('uploadedParts') &&
      @get('uploadedParts').find (part) => part.get('instrument') == @get('instrument') && part.get('instrumentPart') == @get('part')
  isSpecial: false
  specialFile: null
  queueName: Ember.computed 'instrument', 'part', 'isSpecial', ->
    queue = @get('instrument')
    queue += '-' + @get('part') if @get('part')
    queue += '-special' if @get('isSpecial')
    queue
  _createPart: (part, file) ->
    file.upload('/files').then (response) =>
      part = @get('store').createRecord 'part',
        file: response.body.links.self
        name: file.name
        instrument: @get('instrument')
        instrumentPart: part
        score: @get('score')
      part.save().then (part) =>
        @get('paperToaster').show("#{part.get('description')} aangemaakt", { position: 'top right' })
      , (error) => # part.save() failure
        @get('paperToaster').show('Partituur opslaan mislukt', { position: 'top right' })
    , (error) => # file.upload() failure
      if error.status == 413
        @get('paperToaster').show('Bestand te groot', { position: 'top right' })
        @get('fileQueue').find(@get('queueName')).remove(file)
      else
        @get('paperToaster').show('Opladen mislukt', { position: 'top right' })
  actions:
    upload: (file) ->
      if @get('isSpecial')
        @set('specialFile', file)
      else
        @_createPart(@get('part'), file)
    uploadSpecial: () ->
      @_createPart(@get('specialPartName'), @get('specialFile'))
    closeDialog: () ->
      @get('fileQueue').find(@get('queueName')).remove(@get('specialFile'))
      @set('specialFile', null)
      @set('specialPartName', null)
