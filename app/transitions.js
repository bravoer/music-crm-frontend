const transitions = function() {
  this.transition(
    this.fromRoute('main.admin.scores.index'),
    this.toRoute('main.admin.scores.edit'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.scores.index'),
    this.toRoute('main.admin.scores.add'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.musicians.index'),
    this.toRoute('main.admin.musicians.edit'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.musicians.index'),
    this.toRoute('main.admin.musicians.add'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.helpers.current'),
    this.toRoute('main.admin.helpers.event'),
    // transitions in main.admin.helpers.event are handled with liquid-bind in template
    this.use('toRight'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.attendee-tracking.index'),
    this.toRoute('main.admin.attendee-tracking.event'),
    // transitions in main.admin.attendee-tracking.event are handled with liquid-bind in template
    this.use('toRight'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.attendee-tracking.index'),
    this.toRoute('main.admin.attendee-tracking.statistics'),
    this.use('toRight'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.attendee-tracking.event'),
    this.toRoute('main.admin.attendee-tracking.statistics'),
    this.use('toRight'),
    this.reverse('toRight')
  );

  this.transition(
    this.hasClass('edit-mode-toggle'),
    this.toValue(true),
    this.use('crossFade'),
    this.reverse('crossFade')
  );

  this.transition(
    this.hasClass('edit-mode-toggle'),
    this.toValue(true),
    this.use('crossFade'),
    this.reverse('crossFade')
  );

  this.transition(
    this.hasClass('statistics-tab'),
    this.toValue(true),
    this.use('toUp'),
    this.reverse('toUp')
  );

  this.transition(
    this.hasClass('collapse-right-toggle'),
    this.toValue(true),
    this.use('toRight'),
    this.reverse('toLeft')
  );

  this.transition(
    this.hasClass('part-download-card'),
    this.use('scale', { duration: 1000 }),
    this.onInitialRender()
  );

};

export default transitions;
