import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  session: Ember.inject.service('session'),
  sessionAuthenticated() {
    Ember.$.getJSON('/userprofile').then( function(data) {
      let session = this.get('session');
      session.set('data.instrument', data.instrument);
      session.set('data.authGroups', data.authGroups);
      session.set('data.isAdmin', data.authGroups.indexOf('administrators group') >= 0);
      session.set('data.isBoard', data.authGroups.indexOf('board') >= 0);
      session.set('data.isMusician', data.authGroups.indexOf('musician') >= 0);
      session.set('data.isGuest', data.authGroups.indexOf('guest') >= 0);
    }.bind(this));
    this._super();
  }
});
