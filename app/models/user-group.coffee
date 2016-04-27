`import DS from 'ember-data'`
`import MuAuthorizationUserGroupMixin from 'ember-mu-authorization/mixins/mu-authorization-user-group-mixin'`

UserGroup = DS.Model.extend MuAuthorizationUserGroupMixin

`export default UserGroup`
