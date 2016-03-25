`import Ember from 'ember'`

PagePaginationComponent = Ember.Component.extend
  keys: ['first', 'prev', 'next', 'last']
  sortedPagination: Ember.computed 'keys', 'pagination', ->
    result = {}
    @get('keys').map (key) =>
      result[key] = @get('pagination')[key]
    result
  actions:
    changePage: (page) ->
      @sendAction('changePage', page['number'] || 0, page['size'] || 0)

`export default PagePaginationComponent`
