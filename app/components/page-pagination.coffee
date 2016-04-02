`import Ember from 'ember'`

PagePaginationComponent = Ember.Component.extend
  keys: ['first', 'prev', 'next', 'last']
  sortedLinks: Ember.computed 'keys', 'links', ->
    result = {}
    @get('keys').map (key) =>
      result[key] = @get('links')[key]
    result['first'] = undefined unless @get('links.prev')
    result['last'] = undefined unless @get('links.next')
    result
  actions:
    changePage: (link) ->
      @set('page', link['number'] || 0)
      @set('size', link['size'] || 0)

`export default PagePaginationComponent`
