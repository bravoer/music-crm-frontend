`import Ember from 'ember'`

_inverseSort = (sort) ->
  if sort.substring(0,1) == '-' then sort.substring(1) else "-#{sort}"

# This function receives the params `params, hash`
sortIcon = (params) ->
  icon = ''
  field = params[0]
  sort = params[1]
  if sort == field
    icon = "<i class='tiny material-icons'>arrow_downward</i>"
  else if sort == "-#{field}"
    icon = "<i class='tiny material-icons'>arrow_upward</i>"
  return Ember.String.htmlSafe(icon)

SortIconHelper = Ember.HTMLBars.makeBoundHelper sortIcon

`export { sortIcon }`

`export default SortIconHelper`
