`import Ember from 'ember'`

# This function receives the params `params, hash`
paginationIcon = (params) ->
  icon = ''
  switch params[0]
    when 'first' then icon = 'first_page'
    when 'prev' then icon = 'chevron_left'
    when 'next' then icon = 'chevron_right'
    when 'last' then icon = 'last_page'
    else icon = ''
  return icon

PaginationIconHelper = Ember.HTMLBars.makeBoundHelper paginationIcon

`export { paginationIcon }`

`export default PaginationIconHelper`
