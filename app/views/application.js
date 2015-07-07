import Ember from 'ember';

var ApplicationView = Ember.View.extend({
  didInsertElement: function() {
    Ember.$('.button-collapse').sideNav();
    Ember.$('.collapsible').collapsible();
  }
});

export default ApplicationView;
