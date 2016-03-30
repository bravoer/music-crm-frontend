`import Ember from 'ember'`

FieldSortingMixin = Ember.Mixin.create
  _inverseSort: (sort) ->
    if sort.substring(0,1) == '-' then sort.substring(1) else "-#{sort}"
  actions:
    changeSort: (field) ->
      if @get('sort') == field || @get('sort') == @_inverseSort(field)
        @set('sort', @_inverseSort(@get('sort')))
      else
        @set('sort', field)

`export default FieldSortingMixin`
