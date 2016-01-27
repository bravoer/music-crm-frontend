`import Ember from 'ember'`
`import MuLogoutMixin from 'ember-mu-login/mixins/mu-logout'`

LogoutButtonComponent = Ember.Component.extend MuLogoutMixin,
  tagName: 'li'

`export default LogoutButtonComponent`
