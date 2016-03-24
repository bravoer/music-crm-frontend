`import Ember from 'ember'`

PagePaginationComponent = Ember.Component.extend
  actions:
    changePage: (page) ->
      @sendAction('changePage', page['number'] || 0, page['size'] || 0)

`export default PagePaginationComponent`
