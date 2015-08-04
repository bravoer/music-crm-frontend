`import ApplicationAdapter from 'ember-jsonapi-resources/adapters/application'`
`import applyMergePatch from '../utils/apply-merge-patch'`

Adapter = ApplicationAdapter.extend
  saveTimeout: 500

  _lastUpload: {}
  _patchFunctions: {}

  _patchFunctionFor: (url) ->
    patchFunction = () =>
      payload = @get('_lastUpload')[url]
      delete @get('_lastUpload')[url]
      @fetch( url,
        method: 'PATCH'
        body: JSON.stringify(payload)
      ).then (json) =>
        @trigger('didUpdateResource', json)
    @get('_patchFunctions')[url] ||= patchFunction

  updateResource: (resource) ->
    url = resource.get('links.self') || this.get('url') + '/' + resource.get('id')
    json = this.serializer.serializeChanged(resource)
    if !json
      return null
    else
      @get('_lastUpload')[url] ||= {}
      applyMergePatch(@get('_lastUpload')[url], json, -> {})

    Ember.run.debounce(@_patchFunctionFor(url), @get('saveTimeout'))


`export default Adapter`
