`import Ember from 'ember'`

ContextMenuComponent = Ember.Component.extend
  target: Ember.computed 'elementId', ->
    "##{@get('elementId')}"
  targetAttachment: 'top left'
  attachment: 'top left'
  showMenu: false
  actions:
    openMenu: ->
      @set('showMenu', true)
      return false
    closeMenu: ->
      @set('showMenu', false)
      return false
      
`export default ContextMenuComponent`
