`import DS from 'ember-data'`
`import MuAuthorizationUserMixin from 'ember-mu-authorization/mixins/mu-authorization-user-mixin'`

User = DS.Model.extend MuAuthorizationUserMixin

`export default User`
