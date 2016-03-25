`import Ember from 'ember'`

PagePaginationMixin = Ember.Mixin.create
  queryParams: ['page', 'size']
  page: 0
  size: 3
  actions:
    changePage: (page, size) ->
      @set('page', page)
      @set('size', size)

`export default PagePaginationMixin`
