initialize = (app) ->
  app.inject 'component', 'i18n', 'service:i18n'
  app.inject 'controller', 'i18n', 'service:i18n'
  app.inject 'model', 'i18n', 'service:i18n'

I18nInitializer =
  name: 'i18n'
  initialize: initialize
  after: 'ember-i18n'

`export {initialize}`
`export default I18nInitializer`
